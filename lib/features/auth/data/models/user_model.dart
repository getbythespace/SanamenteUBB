// lib/features/auth/data/models/user_model.dart
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String name,
    required String email,
    required String career,
    required int moodFrequency,
    required String moodTime,
  }) : super(
          id: id,
          name: name,
          email: email,
          career: career,
          moodFrequency: moodFrequency,
          moodTime: moodTime,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      career: json['career'],
      moodFrequency: json['moodFrequency'],
      moodTime: json['moodTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'career': career,
      'moodFrequency': moodFrequency,
      'moodTime': moodTime,
    };
  }
}
