import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:procal/routes.dart';
import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final initializeAppProvider = FutureProvider<void>((ref) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final shownIntro = prefs.getBool(SystemStrings.shownLoginIntro);
  await dotenv.load(fileName: 'local.env');
  //await dotenv.load(fileName: 'dev.env');

  if (shownIntro == null || !shownIntro) {
    ref.read(procalRouterProvider).go(Routes.intro.path);
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    final procalService = ref.read(procalServiceProvider);
    final procalUser = await procalService.getUserByUid(currentUser.uid);
    if (procalUser != null) {
      final goals = await procalService.getGoalByUserId(procalUser.id!);
      ref
          .read(authStateNotifierProvider.notifier)
          .setLoggedIn(currentUser, procalUser, goals);
      ref.read(procalRouterProvider).go(Routes.home.path);
    }
  }
  await Health().configure();
});

void main() {
  runApp(const ProviderScope(child: ProCalApp()));
}

class ProCalApp extends ConsumerWidget {
  const ProCalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializeApp = ref.watch(initializeAppProvider);

    return MaterialApp.router(
      title: 'ProCal',
      routerConfig: ref.watch(procalRouterProvider),
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
        brightness: Brightness.light,
        primaryColor: ColorPalette.headerLight,
        colorScheme: MaterialTheme.lightScheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.headerLight,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
        textTheme: Typography.blackCupertino,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
        primaryColor: ColorPalette.headerDark,
        colorScheme: MaterialTheme.darkScheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.headerDark,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        textTheme: Typography.whiteCupertino,
      ),
      builder: (ctx, child) => initializeApp.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (_) => child!,
        error: (err, _) => Text(err.toString()),
      ),
    );
  }
}
