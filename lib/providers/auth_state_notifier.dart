import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/providers/auth_state.dart';
import 'package:procal/services/api/models/goal/goal.dart';
import 'package:procal/services/api/models/user/procal_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  FutureOr<CurrentAuthState> build() => const CurrentAuthState(
    isLoggedIn: false,
    user: null,
    procalUser: null,
    goals: null,
  );

  bool isLoggedIn() => state.hasValue && state.value!.isLoggedIn;

  void setLoggedIn(User user, ProcalUser procalUser, Goal? goals) =>
      state = AsyncData(
        CurrentAuthState(
          isLoggedIn: true,
          user: user,
          procalUser: procalUser,
          goals: goals,
        ),
      );

  void setGoals(Goal goals) {
    if (state.hasValue) {
      final currentState = state.value!;
      state = AsyncData(currentState.copyWith(goals: goals));
    }
  }

  void updateProcalUser(ProcalUser procalUser) {
    if (state.hasValue) {
      final currentState = state.value!;
      state = AsyncData(currentState.copyWith(procalUser: procalUser));
    }
  }

  void clearCurrentUser() => state = const AsyncData(
    CurrentAuthState(
      isLoggedIn: false,
      user: null,
      procalUser: null,
      goals: null,
    ),
  );
}
