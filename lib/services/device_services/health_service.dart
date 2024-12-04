import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:procal/top_level_providers.dart';

class HealthService {
  HealthService({required this.healthManager, required this.ref});

  final Health healthManager;
  final Ref ref;

  final proteinType = HealthDataType.DIETARY_PROTEIN_CONSUMED;
  final calorieType = HealthDataType.DIETARY_ENERGY_CONSUMED;
  final healthTypes = [
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.DIETARY_ENERGY_CONSUMED
  ];

  Future<bool> requestDataAccess() async {
    final hasAccess = await healthManager.hasPermissions(healthTypes);
    if (hasAccess == null || !hasAccess) {
      final access = await healthManager.requestAuthorization(healthTypes,
          permissions: [
            HealthDataAccess.READ_WRITE,
            HealthDataAccess.READ_WRITE
          ]);
      if (access) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<int> getProtein() async {
    final now = DateTime.now();
    final healthDataList = await healthManager.getHealthDataFromTypes(
        types: [proteinType],
        startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
        endTime: now);
    if (healthDataList.isEmpty) {
      return 0;
    } else {
      final total = healthDataList
          .map((healthData) {
            if (healthData.value.$type == 'NumericHealthValue') {
              final healthValue = healthData.value as NumericHealthValue;
              return healthValue.numericValue.toInt();
            } else {
              return 0;
            }
          })
          .toList()
          .sum;

      return total;
    }
  }

  Future<int> getCalories() async {
    final now = DateTime.now();

    final healthDataList = await healthManager.getHealthDataFromTypes(
        types: [calorieType],
        startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
        endTime: now);
    if (healthDataList.isEmpty) {
      return 0;
    } else {
      final total = healthDataList
          .map((healthData) {
            if (healthData.value.$type == 'NumericHealthValue') {
              final healthValue = healthData.value as NumericHealthValue;
              return healthValue.numericValue.toInt();
            } else {
              return 0;
            }
          })
          .toList()
          .sum;
      return total;
    }
  }

  Future<bool> submitProtein(int protein) async {
    final saved = await healthManager.writeHealthData(
        value: protein.toDouble(),
        type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
        startTime: DateTime.now());
    if (saved) {
      final currentProtein = await getProtein();
      ref.read(proteinConsumedProvider.notifier).update((_) => currentProtein);
      return saved;
    }
    return false;
  }

  Future<bool> submitCalories(int calories) async {
    final saved = await healthManager.writeHealthData(
        value: calories.toDouble(),
        type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
        startTime: DateTime.now());
    if (saved) {
      final currentCalories = await getCalories();
      ref
          .read(caloriesConsumedProvider.notifier)
          .update((_) => currentCalories);
      return saved;
    }
    return false;
  }
}
