import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_controller.g.dart';

@riverpod
class WelcomeController extends _$WelcomeController {
  @override
  WelcomeControllerState build() => WelcomeControllerState(
    firstName: '',
    lastName: '',
    age: '',
    primaryGoal: null,
    currentWeight: null,
    weightUnit: WeightUnit.lb,
    height: null,
    heightUnit: HeightUnit.imperial,
  );

  void setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setAge(String age) {
    state = state.copyWith(age: age);
  }

  void setPrimaryGoal(String primaryGoal) {
    state = state.copyWith(primaryGoal: primaryGoal);
  }

  void setCurrentWeight(int currentWeight) {
    state = state.copyWith(currentWeight: currentWeight);
  }

  void setWeightUnit(WeightUnit weightUnit) {
    state = state.copyWith(weightUnit: weightUnit);
  }

  void setHeight(int height) {
    state = state.copyWith(height: height);
  }

  void setHeightUnit(HeightUnit heightUnit) {
    state = state.copyWith(heightUnit: heightUnit);
  }
}

class WelcomeControllerState {
  WelcomeControllerState({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.primaryGoal,
    required this.currentWeight,
    required this.weightUnit,
    required this.height,
    required this.heightUnit,
  });
  final String firstName;
  final String lastName;
  final String age;
  final String? primaryGoal;
  final int? currentWeight;
  final WeightUnit? weightUnit;
  final int? height;
  final HeightUnit? heightUnit;
  WelcomeControllerState copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? primaryGoal,
    int? currentWeight,
    WeightUnit? weightUnit,
    int? height,
    HeightUnit? heightUnit,
  }) => WelcomeControllerState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    age: age ?? this.age,
    primaryGoal: primaryGoal ?? this.primaryGoal,
    currentWeight: currentWeight ?? this.currentWeight,
    weightUnit: weightUnit ?? this.weightUnit,
    height: height ?? this.height,
    heightUnit: heightUnit ?? this.heightUnit,
  );
}

enum WeightUnit {
  kg,
  lb;

  String get name {
    switch (this) {
      case WeightUnit.kg:
        return 'kg';
      case WeightUnit.lb:
        return 'lb';
    }
  }
}

enum HeightUnit {
  metric,
  imperial;

  String get name {
    switch (this) {
      case HeightUnit.metric:
        return 'metric';
      case HeightUnit.imperial:
        return 'imperial';
    }
  }
}
