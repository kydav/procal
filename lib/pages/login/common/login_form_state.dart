import 'package:procal/pages/login/models/validation_model.dart';

class LoginFormState {
  LoginFormState({required this.email, required this.password});

  ValidationModel<String> email;
  ValidationModel<String> password;

  LoginFormState copyWith({
    ValidationModel<String>? email,
    ValidationModel<String>? password,
  }) => LoginFormState(
    email: email ?? this.email,
    password: password ?? this.password,
  );
}
