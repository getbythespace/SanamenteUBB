// lib/features/auth/domain/usecases/register_user.dart
import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<User> call(String name, String email, String password, String career) async {
    return await repository.register(name, email, password, career);
  }
}
