import 'package:flutter/material.dart';
import 'package:procal/models/generated_goals.dart';
import 'package:procal/pages/home/welcome/goal_setting_mode_page.dart';
import 'package:procal/providers/auth_state_notifier.dart';
import 'package:procal/services/ai_service.dart';
import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/goal/goal.dart';
import 'package:procal/services/api/models/user/procal_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_page_state.g.dart';

@riverpod
class WelcomePageState extends _$WelcomePageState {
  @override
  FutureOr<WelcomeState> build() async => WelcomeState(
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

  void setFirstName(String firstName) {
    state = AsyncData(state.value!.copyWith(firstName: firstName));
  }

  void setLastName(String lastName) {
    state = AsyncData(state.value!.copyWith(lastName: lastName));
  }

  void setAge(String age) {
    state = AsyncData(state.value!.copyWith(age: age));
  }

  void setGender(String gender) {
    state = AsyncData(state.value!.copyWith(gender: gender));
  }

  void setPrimaryGoal(String primaryGoal) {
    state = AsyncData(state.value!.copyWith(primaryGoal: primaryGoal));
  }

  void setCurrentWeight(int currentWeight) {
    state = AsyncData(state.value!.copyWith(currentWeight: currentWeight));
  }

  void setHeight(int height) {
    state = AsyncData(state.value!.copyWith(height: height));
  }

  void setMeasurementUnit(MeasurementUnit measurementUnit) {
    state = AsyncData(state.value!.copyWith(measurementUnit: measurementUnit));
  }

  void setGoalSettingMode(GoalSettingMode goalSettingMode) {
    state = AsyncData(state.value!.copyWith(goalSettingMode: goalSettingMode));
  }

  Future<void> setGoals(int proteinGoal, int calorieGoal) async {
    state = const AsyncLoading();
    final authState = ref.watch(authStateNotifierProvider);
    final userId = authState.value?.procalUser?.id;
    final user = authState.value!.procalUser!;
    await ref
        .read(procalServiceProvider)
        .updateUser(
          ProcalUser(
            id: userId,
            email: user.email,
            firebaseUid: user.firebaseUid,
            isActive: user.isActive,
            firstName: state.value!.firstName,
            lastName: state.value!.lastName,
            currentWeight: state.value!.currentWeight?.toDouble(),
            height: state.value!.height?.toDouble(),
            measurementPreference: state.value!.measurementUnit?.name,
            age: state.value!.age.isNotEmpty
                ? int.tryParse(state.value!.age)
                : null,
            gender: state.value!.gender,
          ),
        )
        .then(
          (value) => ref
              .read(authStateNotifierProvider.notifier)
              .updateProcalUser(value),
        )
        .catchError((e, stk) {
          debugPrint('Error updating user: $e');
          state = AsyncError(e, stk);
        });
    await ref
        .read(procalServiceProvider)
        .createGoal(
          Goal(
            proteinGoal: proteinGoal,
            calorieGoal: calorieGoal,
            objective: state.value!.primaryGoal ?? '',
            userId: userId,
          ),
        )
        .then((goal) {
          state = AsyncData(state.value!);
        })
        .catchError((e, stk) {
          debugPrint('Error setting goals: $e');
          state = AsyncError(e, stk);
        });
  }

  Future<void> getGoals() async {
    state = const AsyncLoading();
    try {
      final goals = await ref
          .read(aiServiceProvider.notifier)
          .generateProteinCalorieGoals(
            state.value!.measurementUnit == MeasurementUnit.imperial
                ? '${(state.value!.currentWeight! * 2.20462).toStringAsFixed(0)} lbs'
                : '${state.value!.currentWeight!} kg',
            state.value!.measurementUnit == MeasurementUnit.imperial
                ? '${(state.value!.height! / 30.48).toInt()} ft ${(((state.value!.height! / 30.48) - (state.value!.height! / 30.48).toInt()) * 12).toStringAsFixed(0)} in'
                : '${state.value!.height!} cm',
            state.value!.age,
            state.value!.gender,
            state.value!.primaryGoal!.split('_').join(' '),
          );
      state = AsyncData(
        state.value!.copyWith(generatedGoals: goals, isLoading: false),
      );
    } on Exception catch (e, stk) {
      debugPrint('Error generating goals: $e');
      state = AsyncError(e, stk);
      return;
    }
  }
}

class WelcomeState {
  WelcomeState({
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
  WelcomeState copyWith({
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
  }) => WelcomeState(
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
