// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
  id: json['Id'] as String,
  userId: json['UserId'] as String,
  date: DateTime.parse(json['Date'] as String),
  mealFoods: (json['MealFoods'] as List<dynamic>?)
      ?.map((e) => MealFood.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
  'Id': instance.id,
  'UserId': instance.userId,
  'Date': instance.date.toIso8601String(),
  'MealFoods': instance.mealFoods,
};
