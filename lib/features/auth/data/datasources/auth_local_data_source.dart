// lib/features/auth/data/datasources/auth_local_data_source.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../../../core/error/exceptions.dart';
import 'dart:convert';



abstract class AuthLocalDataSource {
  Future<UserModel> getLastUser();
  Future<void> cacheUser(UserModel userToCache);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString('CACHED_USER', userToCache.toJson().toString());
  }

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString('CACHED_USER');
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Future.value(UserModel.fromJson(jsonMap));
    } else {
      throw CacheException();
    }
  }
}
