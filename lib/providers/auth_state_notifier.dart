import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/providers/auth_state.dart';
import 'package:procal/services/api/models/user/procal_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  FutureOr<CurrentAuthState> build() =>
      const CurrentAuthState(isLoggedIn: false, user: null, procalUser: null);

  bool isLoggedIn() => state.hasValue && state.value!.isLoggedIn;

  void setLoggedIn(User user, ProcalUser procalUser) => state = AsyncData(
    CurrentAuthState(isLoggedIn: true, user: user, procalUser: procalUser),
  );

  void clearCurrentUser() => state = const AsyncData(
    CurrentAuthState(isLoggedIn: false, user: null, procalUser: null),
  );
}
