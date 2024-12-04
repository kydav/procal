import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/pages/home/home_state.dart';
import 'package:procal/services/device_services/health_service.dart';
import 'package:procal/services/device_services/local_storage_service.dart';
import 'package:procal/top_level_providers.dart';

class HomeModel extends StateNotifier<HomeState> {
  HomeModel(
      {required this.ref,
      required this.healthService,
      required this.localStorage,
      required this.proteinConsumed,
      required this.proteinGoal})
      : super(const HomeState.loading()) {
    init();
  }

  final Ref ref;
  final HealthService healthService;
  final LocalStorageService localStorage;
  final StateController<int?> proteinConsumed;
  final StateController<int?> proteinGoal;

  Future<void> init() async {
    if (proteinConsumed.state == null) {
      final protein = await healthService.getProtein();
      proteinConsumed.update((_) => protein);
    }

    if (proteinGoal.state == null) {
      final storedProteinGoal =
          localStorage.getValue(SystemStrings.proteinGoal);
      print(storedProteinGoal);
      if (storedProteinGoal != null &&
          int.tryParse(storedProteinGoal) != null) {
        proteinGoal.update((_) => int.parse(storedProteinGoal));

        print('goal ${proteinGoal.state}');
      }
    }
    state = const HomeState.initial();
  }
}

final homeModelProvider = StateNotifierProvider<HomeModel, HomeState>((ref) {
  final healthService = ref.read(healthServiceProvider);
  final localStorage = ref.read(localStorageServiceProvider);
  final proteinConsumed = ref.read(proteinConsumedProvider.notifier);
  final proteinGoal = ref.read(proteinGoalProvider.notifier);

  return HomeModel(
      ref: ref,
      healthService: healthService,
      localStorage: localStorage,
      proteinConsumed: proteinConsumed,
      proteinGoal: proteinGoal);
});
