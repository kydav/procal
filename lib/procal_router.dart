import 'package:go_router/go_router.dart';
import 'package:procal/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'procal_router.g.dart';

@riverpod
class ProcalRouter extends _$ProcalRouter {
  @override
  GoRouter build() => GoRouter(
    initialLocation: Routes.login.path,
    routes: [
      Routes.home,
      Routes.intro,
      Routes.login,
      Routes.welcome,
      Routes.search,
    ],
    // redirect: (context, state) {
    //   final authState = ref.watch(currentUserProvider);
    //   if (authState.isLoading || authState.hasError) return null;

    //   final isAuthenticated = authState.valueOrNull != null;
    //   final isAuthenticating = state.matchedLocation == Routes.login.path;
    //   ref.watch(firebaseAuthProvider).authStateChanges().listen((User? user) {
    //     if (user == null) {
    //       debugPrint('User is currently signed out!');
    //     }
    //   });

    //   if (!isAuthenticated) {
    //     return Routes.login.path;
    //   }

    //   if (isAuthenticating) {
    //     return null;
    //   }

    //   return null;
    // },
  );
}
