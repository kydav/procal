import 'package:procal/services/api/clients/procal_service.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_detail_controller.g.dart';

@riverpod
class FoodDetailController extends _$FoodDetailController {
  @override
  Future<FatSecretFood> build({
    required String foodId,
    bool isBarcode = false,
  }) async {
    final procalService = ref.read(procalServiceProvider);
    if (isBarcode) {
      return procalService.getFoodByBarcode(foodId);
    } else {
      return procalService.getFoodById(foodId);
    }
  }
}
