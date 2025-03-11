import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:procal/providers/auth_state.dart';
import 'package:procal/top_level_providers.dart';

class AuthStateModel extends StateNotifier<CurrentAuthState> {
  AuthStateModel({
    required this.ref,
    required this.procalRouterProvider,
  }) : super(const CurrentAuthState(isLoggedIn: false, user: null));

  final Ref ref;
  final GoRouter? procalRouterProvider;
  bool isLoggedIn() => state.isLoggedIn;

  void setLoggedIn(User user) =>
      state = state.copyWith(isLoggedIn: true, user: user);

  void clearCurrentUser() => state = state.clearCurrentUser();

  // Future<bool> sessionCheck() async {
  //   if (kIsWeb) {
  //     try {
  //       var userPoolUser = web_cognito_service.UserService.instance().getCurrentUser();
  //       if (userPoolUser != null) {
  //         return web_cognito_service.UserService.instance().checkAuthenticated();
  //       } else {
  //         if (isLoggedIn()) {
  //           await logOutUser();
  //         }
  //         return false;
  //       }
  //     } on CognitoClientException catch (e, stk) {
  //       if (isLoggedIn()) {
  //         await CrashlyticsHelpers.recordError(("Error attempting to get web user. ${e.toString()}"), stk);
  //         await logOutUser();
  //       }
  //       return false;
  //     }
  //   } else {
  //     try {
  //       CognitoAuthSession session = await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;

  //       return session.isSignedIn;
  //     } catch (err, stk) {
  //       if (isLoggedIn()) {
  //         await CrashlyticsHelpers.recordError(
  //             ("Error attempting to fetch auth session from cognito. ${err.toString()}"), stk);
  //         await logOutUser();
  //       }
  //       return false;
  //     }
  //   }
  // }

  Future<void> logOutUser() async {
    // if (kIsWeb) {
    //   await web_cognito_service.UserService.instance().signOut().then((_) async {
    //     ref.read(mixpanelManagerProvider).resetMixpanelOnLogout();
    //     await ref.read(streamChatClientProvider).disconnectUser();
    //   }).catchError((err) async {
    //     debugPrint("Error attempting to sign out from cognito.");
    //   });
    // } else {
    //   await Amplify.Auth.signOut().then((_) async {
    //     ref.read(mixpanelManagerProvider).resetMixpanelOnLogout();
    //     await ref.read(streamChatClientProvider).disconnectUser();
    //   }).catchError((err, stk) async {
    //     await CrashlyticsHelpers.recordError("Error attempting to sign out from Amplify. ${err.toString()}", stk);
    //   });
    // }
    // await softSignOut();
  }

  void clearProviders() {
    //   ref
    //     ..read(appointmentClientDataProvider.notifier).update((state) => null)
    //     ..read(cognitoIdProvider.notifier).update((state) => '')
    //     ..read(patientIdProvider.notifier).update((state) => '')
    //     ..read(userNameProvider.notifier).update((state) => '')
    //     ..read(chatTokenProvider.notifier).update((state) => '')
    //     ..read(userRoleProvider.notifier).update((state) => UserRole.unknown)
    //     ..read(caregiverIdProvider.notifier).update((state) => '')
    //     ..read(chatModelNotifierProvider.notifier).clearChatModel()
    //     ..read(caregiverPatientIdsProvider.notifier).update((state) => <String>[])
    //     ..read(patientImageProvider.notifier).update((state) => <String, Uint8List?>{})
    //     ..read(assignmentsDataProvider.notifier).update((state) => null)
    //     ..read(assignmentsMap.notifier).update((state) => null);
    // }
  }
}

final authStateModelProvider =
    StateNotifierProvider<AuthStateModel, CurrentAuthState>((ref) {
  final procalRouter = ref.read(procalRouterProvider);
  return AuthStateModel(ref: ref, procalRouterProvider: procalRouter);
});
