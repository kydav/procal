import 'package:procal/models/generated_goals.dart';
import 'package:procal/pages/home/welcome/goal_setting_mode_page.dart';
import 'package:procal/services/ai_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_controller.g.dart';

@riverpod
class WelcomeController extends _$WelcomeController {
  @override
  WelcomeControllerState build() => WelcomeControllerState(
    firstName: '',
    lastName: '',
    age: '',
    gender: '',
    primaryGoal: null,
    currentWeight: null,
    height: null,
    measurementUnit: MeasurementUnit.imperial,
    goalSettingMode: GoalSettingMode.ai,
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

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
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

  void setGoalSettingMode(GoalSettingMode goalSettingMode) {
    state = state.copyWith(goalSettingMode: goalSettingMode);
  }

  Future<void> getGoals() async {
    state = state.copyWith(isLoading: true);
    try {
      final goals = await ref
          .read(aiServiceProvider.notifier)
          .generateProteinCalorieGoals(
            state.measurementUnit == MeasurementUnit.imperial
                ? '${(state.currentWeight! * 2.20462).toStringAsFixed(0)} lbs'
                : '${state.currentWeight!} kg',
            state.measurementUnit == MeasurementUnit.imperial
                ? '${(state.height! / 30.48).toInt()} ft ${(((state.height! / 30.48) - (state.height! / 30.48).toInt()) * 12).toStringAsFixed(0)} in'
                : '${state.height!} cm',
            state.age,
            state.gender,
            state.primaryGoal!.split('_').join(' '),
          );
      state = state.copyWith(generatedGoals: goals, isLoading: false);
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      return;
    }
  }
}

class WelcomeControllerState {
  WelcomeControllerState({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.primaryGoal,
    required this.currentWeight,
    required this.height,
    required this.measurementUnit,
    required this.goalSettingMode,
    this.generatedGoals,
    this.isLoading = false,
  });
  final String firstName;
  final String lastName;
  final String age;
  final String gender;
  final String? primaryGoal;
  final int? currentWeight;
  final int? height;
  final MeasurementUnit? measurementUnit;
  final GoalSettingMode? goalSettingMode;
  final bool isLoading;
  final GeneratedGoals? generatedGoals;
  WelcomeControllerState copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? gender,
    String? primaryGoal,
    int? currentWeight,
    int? height,
    MeasurementUnit? measurementUnit,
    GoalSettingMode? goalSettingMode,
    bool? isLoading,
    GeneratedGoals? generatedGoals,
  }) => WelcomeControllerState(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    age: age ?? this.age,
    gender: gender ?? this.gender,
    primaryGoal: primaryGoal ?? this.primaryGoal,
    currentWeight: currentWeight ?? this.currentWeight,
    height: height ?? this.height,
    measurementUnit: measurementUnit ?? this.measurementUnit,
    goalSettingMode: goalSettingMode ?? this.goalSettingMode,
    isLoading: isLoading ?? this.isLoading,
    generatedGoals: generatedGoals ?? this.generatedGoals,
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
