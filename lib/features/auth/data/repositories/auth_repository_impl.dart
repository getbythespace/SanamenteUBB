// lib/features/auth/data/repositories/auth_repository_impl.dart
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/auth_local_data_source.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<User> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.login(email, password);
        localDataSource.cacheUser(remoteUser);
        return remoteUser;
      } on ServerException {
        throw ServerFailure();
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return localUser;
      } on CacheException {
        throw CacheFailure();
      }
    }
  }

  @override
  Future<User> register(String name, String email, String password, String career) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.register(name, email, password, career);
        localDataSource.cacheUser(remoteUser);
        return remoteUser;
      } on ServerException {
        throw ServerFailure();
      }
    } else {
      throw ServerFailure(); // No es posible registrar sin conexión
    }
  }
}
