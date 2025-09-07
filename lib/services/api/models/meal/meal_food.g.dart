// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealFood _$MealFoodFromJson(Map<String, dynamic> json) => MealFood(
  foodId: json['FoodId'] as String,
  foodName: json['FoodName'] as String,
  foodAmount: json['FoodAmount'] as String,
  protein: (json['Protein'] as num).toDouble(),
  calories: (json['Calories'] as num).toDouble(),
  fat: (json['Fat'] as num).toDouble(),
  id: json['Id'] as String?,
  mealId: json['MealId'] as String?,
);

Map<String, dynamic> _$MealFoodToJson(MealFood instance) => <String, dynamic>{
  'Id': instance.id,
  'MealId': instance.mealId,
  'FoodId': instance.foodId,
  'FoodName': instance.foodName,
  'FoodAmount': instance.foodAmount,
  'Protein': instance.protein,
  'Calories': instance.calories,
  'Fat': instance.fat,
};
