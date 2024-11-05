// lib/features/auth/domain/entities/user.dart
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String career;
  final int moodFrequency;
  final String moodTime; // Formateado como 'HH:MM'

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.career,
    required this.moodFrequency,
    required this.moodTime,
  });

  @override
  List<Object?> get props => [id, name, email, career, moodFrequency, moodTime];
}
