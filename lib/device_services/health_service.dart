import 'package:health/health.dart';

class HealthService {
  HealthService({required this.healthManager});

  final Health healthManager;
  final proteinType = HealthDataType.DIETARY_PROTEIN_CONSUMED;
  final calorieType = HealthDataType.DIETARY_ENERGY_CONSUMED;
  final healthTypes = [
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.DIETARY_ENERGY_CONSUMED
  ];

  Future<void> requestDataAccess() async {
    final hasAccess = await healthManager.hasPermissions(healthTypes);
    if (hasAccess == null || !hasAccess) {
      await healthManager.requestAuthorization(healthTypes, permissions: [
        HealthDataAccess.READ_WRITE,
        HealthDataAccess.READ_WRITE
      ]);
    }
  }

  Future<void> getProtein() async {
    final now = DateTime.now();
    final healthData = await healthManager.getHealthDataFromTypes(
        types: [proteinType],
        startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
        endTime: now);
  }

  Future<void> getCalories() async {
    final now = DateTime.now();

    final healthData = await healthManager.getHealthDataFromTypes(
        types: [calorieType],
        startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
        endTime: now);
  }

  Future<bool> submitProtein(int protein) async =>
      healthManager.writeHealthData(
          value: protein.toDouble(),
          type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
          startTime: DateTime.now());

  Future<bool> submitCalories(int calories) async =>
      healthManager.writeHealthData(
          value: calories.toDouble(),
          type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
          startTime: DateTime.now());
}
