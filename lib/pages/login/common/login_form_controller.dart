import 'package:procal/pages/login/common/login_form_state.dart';
import 'package:procal/pages/login/models/validation_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_controller.g.dart';

@riverpod
class LoginFormController extends _$LoginFormController {
  @override
  LoginFormState build() => LoginFormState(
    email: ValidationModel(null, null),
    password: ValidationModel(null, null),
  );

  bool isValid() => state.email.error == null && state.password.error == null;

  final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  );
  final RegExp _firebaseStrongPasswordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
  );

  // ignore: body_might_complete_normally_nullable
  String? validateEmail(String? value) {
    if (value != null && value.isNotEmpty && _emailRegex.hasMatch(value)) {
      state = state.copyWith(email: ValidationModel(value, null));
    } else if (value == null || value.isEmpty) {
      state = state.copyWith(
        email: ValidationModel(null, 'Email cannot be empty'),
      );
    } else if (!_emailRegex.hasMatch(value)) {
      state = state.copyWith(
        email: ValidationModel(null, 'Enter a valid email'),
      );
    }
  }

  void clearEmailValidation() =>
      state = state.copyWith(email: ValidationModel(null, null));

  // ignore: body_might_complete_normally_nullable
  String? validatePassword(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        _firebaseStrongPasswordRegex.hasMatch(value)) {
      state = state.copyWith(password: ValidationModel(value, null));
    } else if (value != null && value.isEmpty) {
      state = state.copyWith(
        password: ValidationModel(null, 'Password cannot be empty'),
      );
    } else if (value != null && !_firebaseStrongPasswordRegex.hasMatch(value)) {
      state = state.copyWith(
        password: ValidationModel(
          null,
          'Password must be at least 6 characters long, contain at least one uppercase letter, one lowercase letter, and one number',
        ),
      );
    }
  }

  void clearPasswordValidation() =>
      state = state.copyWith(password: ValidationModel(null, null));
}
