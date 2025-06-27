import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:procal/services/device_services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() async {
    // Initial state is set in the LoginModel constructor
    // so we don't need to do anything here.
  }

  Future<void> createUser(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(authServiceProvider.notifier)
          .createUser(username, password);
      ref.read(authStateNotifierProvider.notifier).setLoggedIn(result.user!);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      if (e.code == 'weak-password') {
        state = AsyncValue.error('The password provided is too weak.', stk);
      } else if (e.code == 'email-already-in-use') {
        state = AsyncValue.error(
          'The account already exists for that email.',
          stk,
        );
      } else {
        debugPrint('AuthException: ${e.code}  - ${e.message}');
        state = AsyncValue.error('Failed to create user', stk);
      }
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to create user', stk);
    }
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(authServiceProvider.notifier)
          .loginUser(username, password);
      ref.read(authStateNotifierProvider.notifier).setLoggedIn(result.user!);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      if (e.code == 'user-not-found') {
        state = AsyncValue.error(
          'No user found with that email and password.',
          stk,
        );
      } else if (e.code == 'wrong-password') {
        state = AsyncValue.error('Wrong password provided for that user.', stk);
      } else {
        debugPrint('AuthException: ${e.code}  - ${e.message}');
        state = AsyncValue.error('Failed to create user', stk);
      }
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to create user', stk);
    }
  }
}
