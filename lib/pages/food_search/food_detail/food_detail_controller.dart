import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_detail_controller.g.dart';

@riverpod
class FoodDetailController extends _$FoodDetailController {
  @override
  Future<FatSecretFood> build(String foodId) async {
    final procalService = ref.read(procalServiceProvider);
    return procalService.getFoodById(foodId);
  }
}
