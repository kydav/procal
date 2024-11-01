import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:procal/services/device_services/local_storage_service.dart';

final healthServiceProvider =
    Provider<HealthService>((_) => HealthService(healthManager: Health()));

final localStorageServiceProvider =
    Provider<LocalStorageService>((_) => LocalStorageService());

final proteinConsumedProvider = StateProvider<int?>((_) => null);
final caloriesConsumedProvider = StateProvider<int?>((_) => null);

final proteinGoalProvider = StateProvider<int?>((_) => null);
