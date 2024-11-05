// lib/features/auth/presentation/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc({
    required this.loginUser,
    required this.registerUser,
  }) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUser(event.email, event.password);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(message: 'Inicio de sesión fallido'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerUser(event.name, event.email, event.password, event.career);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthFailure(message: 'Registro fallido'));
      }
    });
  }
}
