// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) => Goal(
  userId: json['UserId'] as String?,
  proteinGoal: (json['ProteinGoal'] as num).toInt(),
  calorieGoal: (json['CalorieGoal'] as num).toInt(),
  currentWeight: (json['CurrentWeight'] as num).toInt(),
  objective: json['Objective'] as String,
  weightGoal: (json['WeightGoal'] as num?)?.toInt(),
);

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
  'UserId': instance.userId,
  'ProteinGoal': instance.proteinGoal,
  'CalorieGoal': instance.calorieGoal,
  'WeightGoal': instance.weightGoal,
  'CurrentWeight': instance.currentWeight,
  'Objective': instance.objective,
};
