// lib/core/utils/validators.dart
class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo no puede estar vacío';
    }
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@ubiobio\.cl$",
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Ingrese un correo válido de UBB (@ubiobio.cl)';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

}
