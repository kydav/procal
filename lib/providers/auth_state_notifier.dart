import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/providers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  FutureOr<CurrentAuthState> build() async =>
      const CurrentAuthState(isLoggedIn: false, user: null);

  bool isLoggedIn() => state.hasValue && state.value!.isLoggedIn;

  void setLoggedIn(User user) =>
      state = AsyncData(CurrentAuthState(isLoggedIn: true, user: user));

  void clearCurrentUser() =>
      state = const AsyncData(CurrentAuthState(isLoggedIn: false, user: null));
}
