import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:localstorage/localstorage.dart';
import 'package:procal/top_level_providers.dart';

final initializeAppProvider = FutureProvider<void>((ref) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
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
      routerConfig: ref.read(procalRouterProvider),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      builder: (ctx, child) => initializeApp.when(
          loading: () => const CircularProgressIndicator(),
          data: (_) => child!,
          error: (err, _) => Text(err.toString())),
    );
  }
}
