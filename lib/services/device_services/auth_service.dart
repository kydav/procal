import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:procal/providers/auth_state_model.dart';

class AuthService {
  AuthService({required this.ref});

  final Ref ref;

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
    ref.read(authStateModelProvider.notifier).clearCurrentUser();
  }
}
