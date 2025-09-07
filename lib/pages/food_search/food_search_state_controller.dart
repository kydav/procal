import 'package:health/health.dart';
import 'package:procal/pages/food_search/meal_state.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_search_state_controller.g.dart';

@riverpod
class FoodSearchStateController extends _$FoodSearchStateController {
  @override
  MealState build() => MealState(mealType: MealType.UNKNOWN, foods: []);

  void setMealType(MealType mealType) {
    state = MealState(mealType: mealType, foods: state.foods);
  }

  void addFood(FatSecretFood food) {
    state = MealState(mealType: state.mealType, foods: [...state.foods, food]);
  }

  void removeFood(FatSecretFood food) {
    state = MealState(
      mealType: state.mealType,
      foods: state.foods.where((f) => f != food).toList(),
    );
  }
}
