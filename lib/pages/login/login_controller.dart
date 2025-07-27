import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procal/pages/login/models/login_errors.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:procal/routes.dart';
import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/user/procal_user.dart';
import 'package:procal/services/device_services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() async {
    // no operations needed on build
  }

  Future<void> createUser(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(authServiceProvider.notifier)
          .createUser(username, password);

      await ref
          .read(procalServiceProvider)
          .createUser(
            ProcalUser(
              email: username,
              firstName: 'Kyler',
              lastName: 'Tester',
              isActive: true,
            ),
          );
      ref.read(authStateNotifierProvider.notifier).setLoggedIn(result.user!);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      final error = CreateUserError.fromCode(e.code);
      state = AsyncValue.error(error.message, stk);
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to create user', stk);
      return;
    }
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref
          .read(authServiceProvider.notifier)
          .loginUser(username, password);

      // final user = await ref
      //     .read(procalServiceProvider)
      //     .getUserByEmail(username);
      // await ref
      //     .read(procalServiceProvider)
      //     .createUser(
      //       ProcalUser(
      //         email: username,
      //         firstName: 'Kyler',
      //         lastName: 'Tester',
      //         isActive: true,
      //       ),
      //     );
      //ref.read(procalRouterProvider).go(Routes.intro.path);
      ref.read(procalRouterProvider).go(Routes.home.path);
      ref.read(authStateNotifierProvider.notifier).setLoggedIn(result.user!);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      final error = LoginError.fromCode(e.code);
      state = AsyncValue.error(error.message, stk);
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to login user', stk);
      return;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(authServiceProvider.notifier)
          .sendResetPasswordEmail(email);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      final error = SendPasswordResetEmailError.fromCode(e.code);
      state = AsyncValue.error(error.message, stk);
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to send password reset email', stk);
    }
  }

  Future<void> confirmPasswordReset(String code, String newPassword) async {
    state = const AsyncValue.loading();
    try {
      await ref
          .read(authServiceProvider.notifier)
          .confirmResetPassowrd(code, newPassword);
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e, stk) {
      final error = ConfirmResetPasswordError.fromCode(e.code);
      state = AsyncValue.error(error.message, stk);
      return;
    } on Exception catch (e, stk) {
      debugPrint('AuthException: ${e.toString()}');
      state = AsyncValue.error('Failed to confirm password reset', stk);
    }
  }
}
