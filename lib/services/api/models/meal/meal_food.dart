import 'package:json_annotation/json_annotation.dart';

part 'meal_food.g.dart';

@JsonSerializable()
class MealFood {
  MealFood({
    required this.id,
    required this.mealId,
    required this.foodId,
    required this.foodName,
    required this.foodAmount,
    required this.protein,
    required this.calories,
    required this.fat,
  });
  factory MealFood.fromJson(Map<String, dynamic> json) =>
      _$MealFoodFromJson(json);

  @JsonKey(name: 'Id')
  final String id;
  @JsonKey(name: 'MealId')
  final String mealId;
  @JsonKey(name: 'FoodId')
  final String foodId;
  @JsonKey(name: 'FoodName')
  final String foodName;
  @JsonKey(name: 'FoodAmount')
  final String foodAmount;
  @JsonKey(name: 'Protein')
  final int protein;
  @JsonKey(name: 'Calories')
  final int calories;
  @JsonKey(name: 'Fat')
  final int fat;

  Map<String, dynamic> toJson() => _$MealFoodToJson(this);
}
