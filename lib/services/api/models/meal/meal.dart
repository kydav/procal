import 'package:json_annotation/json_annotation.dart';
import 'package:procal/services/api/models/meal/meal_food.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  Meal({
    required this.id,
    required this.userId,
    required this.date,
    this.mealFoods,
  });
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  @JsonKey(name: 'Id')
  final String id;
  @JsonKey(name: 'UserId')
  final String userId;
  @JsonKey(name: 'Date')
  final DateTime date;
  @JsonKey(name: 'MealFoods')
  final List<MealFood>? mealFoods;

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
