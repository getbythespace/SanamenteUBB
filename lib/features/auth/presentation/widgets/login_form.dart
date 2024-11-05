// lib/features/auth/presentation/widgets/login_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../../../../../core/utils/validators.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo UBB'),
              validator: Validators.validateEmail,
              onSaved: (value) => email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator: Validators.validatePassword,
              onSaved: (value) => password = value!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLoginButtonPressed,
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('¿No tienes una cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      BlocProvider.of<AuthBloc>(context).add(
        LoginRequested(email: email, password: password),
      );
    }
  }
}
