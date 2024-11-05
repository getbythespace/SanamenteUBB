// lib/features/auth/presentation/widgets/register_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/utils/date_helper.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String password;
  late String career;

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
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese su nombre';
                }
                return null;
              },
              onSaved: (value) => name = value!,
            ),
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Carrera'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese su carrera';
                }
                return null;
              },
              onSaved: (value) => career = value!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onRegisterButtonPressed,
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _onRegisterButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      BlocProvider.of<AuthBloc>(context).add(
        RegisterRequested(
          name: name,
          email: email,
          password: password,
          career: career,
        ),
      );
    }
  }
}
