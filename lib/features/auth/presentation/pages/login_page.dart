// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
