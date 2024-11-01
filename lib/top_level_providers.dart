import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:procal/device_services/health_service.dart';
import 'package:procal/device_services/local_storage_service.dart';

final healthManagerProvider = Provider<Health>((_) => Health());

final healthServiceProvider = Provider<HealthService>(
    (ref) => HealthService(healthManager: ref.read(healthManagerProvider)));

final localStorageServiceProvider =
    Provider<LocalStorageService>((ref) => LocalStorageService());

final proteinConsumed = StateProvider((_) => 0);
final caloriesConsumed = StateProvider((_) => 0);
