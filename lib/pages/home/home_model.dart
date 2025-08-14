// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:procal/constants/system_strings.dart';
// import 'package:procal/pages/home/home_state.dart';
// import 'package:procal/services/device_services/health_service.dart';
// import 'package:procal/top_level_providers.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeModel extends StateNotifier<HomeState> {
//   HomeModel({
//     required this.healthService,
//     required this.proteinConsumed,
//     required this.proteinGoal,
//     required this.caloriesConsumed,
//     required this.caloriesGoal,
//   }) : super(const HomeState.loading()) {
//     init();
//   }
//   final HealthService healthService;
//   final StateController<int?> proteinConsumed;
//   final StateController<int?> proteinGoal;
//   final StateController<int?> caloriesConsumed;
//   final StateController<int?> caloriesGoal;

//   Future<void> init() async {
//     final hasAccess = await healthService.requestDataAccess();
//     final protein = await healthService.getProtein();
//     proteinConsumed.update((_) => protein);

//     final calories = await healthService.getCalories();
//     caloriesConsumed.update((_) => calories);

//     if (proteinGoal.state == null) {
//       final prefs = await SharedPreferences.getInstance();
//       final storedProteinGoal = prefs.getInt(SystemStrings.proteinGoal);
//       if (storedProteinGoal != null) {
//         proteinGoal.update((_) => storedProteinGoal);
//       }
//     }
//     if (caloriesGoal.state == null) {
//       final prefs = await SharedPreferences.getInstance();
//       final storedCaloriesGoal = prefs.getInt(SystemStrings.caloriesGoal);
//       if (storedCaloriesGoal != null) {
//         caloriesGoal.update((_) => storedCaloriesGoal);
//       }
//     }
//     state = const HomeState.initial();
//   }
// }

// final homeModelProvider = StateNotifierProvider<HomeModel, HomeState>((ref) {
//   final healthService = ref.read(healthServiceProvider.notifier);
//   final proteinConsumed = ref.read(proteinConsumedProvider.notifier);
//   final proteinGoal = ref.read(proteinGoalProvider.notifier);
//   final caloriesConsumed = ref.read(caloriesConsumedProvider.notifier);
//   final caloriesGoal = ref.read(caloriesGoalProvider.notifier);

//   return HomeModel(
//     healthService: healthService,
//     proteinConsumed: proteinConsumed,
//     proteinGoal: proteinGoal,
//     caloriesConsumed: caloriesConsumed,
//     caloriesGoal: caloriesGoal,
//   );
// });
