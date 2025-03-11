import 'package:firebase_auth/firebase_auth.dart';

class CurrentAuthState {
  const CurrentAuthState({required this.isLoggedIn, required this.user});

  final bool isLoggedIn;
  final User? user;

  CurrentAuthState copyWith({bool? isLoggedIn, User? user}) => CurrentAuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn, user: user ?? this.user);

  CurrentAuthState clearCurrentUser() =>
      CurrentAuthState(isLoggedIn: false, user: null);
}
