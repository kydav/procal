import 'package:health/health.dart';
import 'package:procal/services/api/models/food/food.dart';

// part 'food_search_state.g.dart';

// @riverpod
// class FoodSearchState extends _$FoodSearchState {
//   @override
//   // List<FoodItem> build() {
//   //   return [];
//   // }
// }

class MealState {
  MealState({required this.mealType, this.foods = const []});

  final MealType mealType;
  final List<FatSecretFood> foods;
}
