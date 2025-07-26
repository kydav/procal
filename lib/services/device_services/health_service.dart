import 'package:collection/collection.dart';
import 'package:health/health.dart';
import 'package:procal/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_service.g.dart';

@riverpod
class HealthService extends _$HealthService {
  late Health _healthManager;
  @override
  FutureOr<void> build() async {
    _healthManager = Health();
  }

  final _proteinType = HealthDataType.DIETARY_PROTEIN_CONSUMED;
  final _calorieType = HealthDataType.DIETARY_ENERGY_CONSUMED;
  final _healthTypes = [
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.DIETARY_ENERGY_CONSUMED,
  ];

  Future<bool> requestDataAccess() async {
    final hasAccess = await _healthManager.hasPermissions(_healthTypes);
    if (hasAccess == null || !hasAccess) {
      final access = await _healthManager.requestAuthorization(
        _healthTypes,
        permissions: [HealthDataAccess.READ_WRITE, HealthDataAccess.READ_WRITE],
      );
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
    final healthDataList = await _healthManager.getHealthDataFromTypes(
      types: [_proteinType],
      startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
      endTime: now,
    );
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

    final healthDataList = await _healthManager.getHealthDataFromTypes(
      types: [_calorieType],
      startTime: now.subtract(Duration(hours: now.hour, minutes: now.minute)),
      endTime: now,
    );
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
    final saved = await _healthManager.writeHealthData(
      value: protein.toDouble(),
      type: HealthDataType.DIETARY_PROTEIN_CONSUMED,
      startTime: DateTime.now(),
    );
    if (saved) {
      final currentProtein = await getProtein();
      ref.read(proteinConsumedProvider.notifier).update((_) => currentProtein);
      return saved;
    }
    return false;
  }

  Future<bool> submitCalories(int calories) async {
    final saved = await _healthManager.writeHealthData(
      value: calories.toDouble(),
      type: HealthDataType.DIETARY_ENERGY_CONSUMED,
      startTime: DateTime.now(),
    );
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
