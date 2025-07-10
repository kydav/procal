import 'package:json_annotation/json_annotation.dart';
import 'package:procal/services/api/models/food/serving.dart';

part 'food.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ReturnFood {
  ReturnFood({required this.food});
  factory ReturnFood.fromJson(Map<String, dynamic> json) =>
      _$ReturnFoodFromJson(json);
  @JsonKey(name: 'food')
  Food food;

  Map<String, dynamic> toJson() => _$ReturnFoodToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Food {
  Food({
    required this.foodId,
    required this.foodName,
    required this.foodType,
    required this.serving,
  });
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  @JsonKey(name: 'food_id')
  String foodId;
  @JsonKey(name: 'food_name')
  String foodName;
  @JsonKey(name: 'food_type')
  String foodType;
  @JsonKey(name: 'servings')
  Servings serving;

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
