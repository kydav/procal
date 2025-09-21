import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:procal/routes.dart';
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
    ref.read(procalRouterProvider).go(Routes.login.path);
    ref.read(authStateProvider.notifier).clearCurrentUser();
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
        // Uncomment the following line if you want to handle the code in-app
        // and provide a URL for the reset password page.
        // Will need to handle deep linking to use
        // actionCodeSettings: ActionCodeSettings(handleCodeInApp: true, url: ''),
        // actionCodeSettings: ActionCodeSettings(
        //   handleCodeInApp: true,
        //   url: 'https://yourapp.com/reset-password',
        // ),
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
