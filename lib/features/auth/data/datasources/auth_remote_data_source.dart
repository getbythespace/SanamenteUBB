// lib/features/auth/data/datasources/auth_remote_data_source.dart
import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/error/exceptions.dart';
import '../../../core/config/constants.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password, String career);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('${AppConstants.apiBaseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> register(String name, String email, String password, String career) async {
    final response = await client.post(
      Uri.parse('${AppConstants.apiBaseUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'career': career,
      }),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
