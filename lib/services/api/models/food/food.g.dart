// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnFood _$ReturnFoodFromJson(Map<String, dynamic> json) =>
    ReturnFood(food: Food.fromJson(json['food'] as Map<String, dynamic>));

Map<String, dynamic> _$ReturnFoodToJson(ReturnFood instance) =>
    <String, dynamic>{'food': instance.food.toJson()};

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
  foodId: json['food_id'] as String,
  foodName: json['food_name'] as String,
  foodType: json['food_type'] as String,
  serving: Servings.fromJson(json['servings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
  'food_id': instance.foodId,
  'food_name': instance.foodName,
  'food_type': instance.foodType,
  'servings': instance.serving.toJson(),
};
