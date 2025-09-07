import 'package:health/health.dart';
import 'package:procal/pages/food_search/meal_state.dart';
import 'package:procal/services/api/models/meal/meal_food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_search_state_controller.g.dart';

@Riverpod(keepAlive: true)
class FoodSearchStateController extends _$FoodSearchStateController {
  @override
  MealState build() => MealState(mealType: MealType.UNKNOWN, foods: []);

  void setMealType(MealType mealType) {
    state = MealState(mealType: mealType, foods: state.foods);
  }

  void addFood(MealFood food) {
    state = state.copyWith(foods: [...state.foods, food]);
  }

  void removeFood(MealFood food) {
    final newList = state.foods.where((f) => f != food).toList();
    state = MealState(mealType: state.mealType, foods: newList);
  }
}
