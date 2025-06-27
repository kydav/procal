import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  FutureOr<void> build() {
    // Initial state is set in the AuthStateModel constructor
    // so we don't need to do anything here.
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
}
