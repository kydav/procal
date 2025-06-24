import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:procal/pages/login/login_state.dart';
import 'package:procal/providers/auth_state_model.dart';
import 'package:procal/services/device_services/auth_service.dart';
import 'package:procal/top_level_providers.dart';

class LoginModel extends StateNotifier<LoginState> {
  LoginModel({required this.authService, required this.authStateModel})
    : super(const LoginState.initial());
  final AuthService authService;
  AuthStateModel authStateModel;
  Future<void> createUser(String username, String password) async {
    state = const LoginState.loading();
    try {
      final result = await authService.createUser(username, password);
      authStateModel.setLoggedIn(result.user!);
      state = const LoginState.authenticated();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        state = const LoginState.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        state = const LoginState.error(
          'The account already exists for that email.',
        );
      } else {
        debugPrint('AuthException: ${e.code}  - ${e.message}');
        state = const LoginState.error('Failed to create user');
      }
      return;
    } on Exception catch (e) {
      debugPrint('AuthException: ${e.toString()}');
      state = const LoginState.error('Failed to create user');
    }
  }

  Future<void> login(String username, String password) async {
    state = const LoginState.loading();
    try {
      final result = await authService.loginUser(username, password);
      authStateModel.setLoggedIn(result.user!);
      state = const LoginState.authenticated();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = const LoginState.error(
          'No user found with that email and password.',
        );
      } else if (e.code == 'wrong-password') {
        state = const LoginState.error(
          'Wrong password provided for that user.',
        );
      } else {
        debugPrint('AuthException: ${e.code}  - ${e.message}');
        state = const LoginState.error('Failed to create user');
      }
      return;
    } on Exception catch (e) {
      debugPrint('AuthException: ${e.toString()}');
      state = const LoginState.error('Failed to create user');
    }
  }
}

final loginModelProvider = StateNotifierProvider<LoginModel, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  final authStateModel = ref.read(authStateModelProvider.notifier);
  return LoginModel(authService: authService, authStateModel: authStateModel);
});
