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
    height: null,
    measurementUnit: MeasurementUnit.imperial,
  );

  @override
  bool updateShouldNotify(
    WelcomeControllerState previous,
    WelcomeControllerState next,
  ) =>
      previous.currentWeight != next.currentWeight ||
      previous.height != next.height;

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

  void setHeight(int height) {
    state = state.copyWith(height: height);
  }

  void setMeasurementUnit(MeasurementUnit measurementUnit) {
    state = state.copyWith(measurementUnit: measurementUnit);
  }
}

class WelcomeControllerState {
  WelcomeControllerState({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.primaryGoal,
    required this.currentWeight,
    required this.height,
    required this.measurementUnit,
  });
  final String firstName;
  final String lastName;
  final String age;
  final String? primaryGoal;
  final int? currentWeight;
  final int? height;
  final MeasurementUnit? measurementUnit;
  WelcomeControllerState copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? primaryGoal,
    int? currentWeight,
    int? height,
    MeasurementUnit? measurementUnit,
  }) => WelcomeControllerState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    age: age ?? this.age,
    primaryGoal: primaryGoal ?? this.primaryGoal,
    currentWeight: currentWeight ?? this.currentWeight,
    height: height ?? this.height,
    measurementUnit: measurementUnit ?? this.measurementUnit,
  );
}

enum MeasurementUnit {
  metric,
  imperial;

  String get name {
    switch (this) {
      case MeasurementUnit.metric:
        return 'metric';
      case MeasurementUnit.imperial:
        return 'imperial';
    }
  }
}
