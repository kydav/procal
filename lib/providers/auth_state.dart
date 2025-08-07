import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/services/api/models/user/procal_user.dart';

class CurrentAuthState {
  const CurrentAuthState({
    required this.isLoggedIn,
    required this.user,
    required this.procalUser,
  });

  final bool isLoggedIn;
  final User? user;
  final ProcalUser? procalUser;

  CurrentAuthState copyWith({
    bool? isLoggedIn,
    User? user,
    ProcalUser? procalUser,
  }) => CurrentAuthState(
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    user: user ?? this.user,
    procalUser: procalUser ?? this.procalUser,
  );

  CurrentAuthState clearCurrentUser() =>
      const CurrentAuthState(isLoggedIn: false, user: null, procalUser: null);
}
