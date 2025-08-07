// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) => Goal(
  userId: json['userId'] as String?,
  proteinGoal: (json['proteinGoal'] as num).toInt(),
  calorieGoal: (json['calorieGoal'] as num).toInt(),
  currentWeight: (json['currentWeight'] as num).toInt(),
  objective: json['objective'] as String,
  weightGoal: (json['weightGoal'] as num?)?.toInt(),
);

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
  'userId': instance.userId,
  'proteinGoal': instance.proteinGoal,
  'calorieGoal': instance.calorieGoal,
  'weightGoal': instance.weightGoal,
  'currentWeight': instance.currentWeight,
  'objective': instance.objective,
};
