import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';
import 'package:procal/pages/home/home_page.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:procal/services/device_services/local_storage_service.dart';

final healthServiceProvider =
    Provider<HealthService>((_) => HealthService(healthManager: Health()));

final localStorageServiceProvider =
    Provider<LocalStorageService>((_) => LocalStorageService());

final proteinConsumedProvider = StateProvider<int?>((_) => null);
final caloriesConsumedProvider = StateProvider<int?>((_) => null);

final proteinGoalProvider = StateProvider<int?>((_) => null);

final procalRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        // GoRoute(
        //   path: '/page2',
        //   builder: (context, state) => const Page2Screen(),
        // ),
      ],
    ));
