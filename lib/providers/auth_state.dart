import 'package:firebase_auth/firebase_auth.dart';
import 'package:procal/services/api/models/goal/goal.dart';
import 'package:procal/services/api/models/user/procal_user.dart';

class CurrentAuthState {
  const CurrentAuthState({
    required this.isLoggedIn,
    required this.user,
    required this.procalUser,
    required this.goals,
  });

  final bool isLoggedIn;
  final User? user;
  final ProcalUser? procalUser;
  final Goal? goals;

  CurrentAuthState copyWith({
    bool? isLoggedIn,
    User? user,
    ProcalUser? procalUser,
    Goal? goals,
  }) => CurrentAuthState(
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    user: user ?? this.user,
    procalUser: procalUser ?? this.procalUser,
    goals: goals ?? this.goals,
  );

  CurrentAuthState clearCurrentUser() => const CurrentAuthState(
    isLoggedIn: false,
    user: null,
    procalUser: null,
    goals: null,
  );
}
