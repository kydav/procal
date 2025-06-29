import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  FutureOr<void> build() {
    // no operations needed on build
  }

  Future<UserCredential> createUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on Exception {
      rethrow;
    }
  }

  Future<UserCredential> loginUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on Exception {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    await FirebaseAuth.instance.signOut();
    ref.read(authStateNotifierProvider.notifier).clearCurrentUser();
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
          handleCodeInApp: true,
          url: 'https://yourapp.com/reset-password',
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  Future<String> confirmResetPassowrd(String code, String newPassword) async {
    try {
      final email = await FirebaseAuth.instance.verifyPasswordResetCode(code);
      await FirebaseAuth.instance.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
      return email;
    } on Exception {
      rethrow;
    }
  }
}
