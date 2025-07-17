import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';
import 'package:procal/routes.dart';
import 'package:procal/services/ai_service.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:procal/services/device_services/local_storage_service.dart';

final proteinConsumedProvider = StateProvider<int?>((_) => null);
final proteinGoalProvider = StateProvider<int?>((_) => null);

final caloriesConsumedProvider = StateProvider<int?>((_) => null);
final caloriesGoalProvider = StateProvider<int?>((_) => null);

final healthServiceProvider = Provider<HealthService>(
  (ref) => HealthService(healthManager: Health(), ref: ref),
);

final localStorageServiceProvider = Provider<LocalStorageService>(
  (_) => LocalStorageService(),
);

final aiServiceProvider = Provider<AiService>(
  (ref) => AiService(
    model: FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash'),
  ),
);

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
);

final currentUserProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges();
});

final procalRouterProvider = Provider(
  (ref) => _routeConfig(
    redirect: (context, state) {
      final authState = ref.watch(currentUserProvider);
      if (authState.isLoading || authState.hasError) return null;

      final isAuthenticated = authState.valueOrNull != null;
      final isAuthenticating = state.matchedLocation == Routes.login.path;
      ref.watch(firebaseAuthProvider).authStateChanges().listen((User? user) {
        if (user == null) {
          debugPrint('User is currently signed out!');
        } else {
          debugPrint('User is signed in!');
        }
      });

      if (!isAuthenticated) {
        return Routes.login.path;
      }

      if (isAuthenticating) {
        return null;
      }

      return null;
    },
  ),
);

GoRouter _routeConfig({GoRouterRedirect? redirect}) => GoRouter(
  redirect: redirect,
  routes: [
    Routes.home,
    Routes.intro,
    Routes.login,
    Routes.search,
    Routes.foodDetail,
  ],
);
