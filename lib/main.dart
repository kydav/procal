import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/procal_router.dart';
import 'package:procal/routes.dart';
import 'package:procal/theme.dart';
import 'package:procal/top_level_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final initializeAppProvider = FutureProvider<void>((ref) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  ref.read(localStorageServiceProvider).sharedPreferences = prefs;
  final shownIntro = prefs.getBool(SystemStrings.shownLoginIntro);
  if (shownIntro == null || !shownIntro) {
    ref.read(procalRouterProvider).go(Routes.intro.path);
  }
  await Health().configure();
  //await dotenv.load(fileName: 'dev.env');
  await dotenv.load(fileName: 'local.env');
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
        primaryColor: ColorPalette.headerDark,
        colorScheme: MaterialTheme.darkScheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.headerDark,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        textTheme: Typography.whiteCupertino,
      ),
      builder: (ctx, child) => initializeApp.when(
        loading: () => const CircularProgressIndicator(),
        data: (_) => child!,
        error: (err, _) => Text(err.toString()),
      ),
    );
  }
}
