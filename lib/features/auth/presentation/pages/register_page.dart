// lib/features/auth/presentation/pages/register_page.dart
import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
