import 'package:dio/dio.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:retrofit/retrofit.dart';

part 'procal_client.g.dart';

@RestApi()
abstract class ProcalClient {
  factory ProcalClient(Dio dio, {String baseUrl}) = _ProcalClient;

  @GET('/food/{id}')
  Future<FatSecretFood> getFoodById(@Path('id') String id);

  @GET('/food/{barcode}/barcode')
  Future<FatSecretFood> getFoodByBarcode(@Path('barcode') String barcode);

  @GET('/food/{foodName}/search/{page}')
  Future<List<Food>> searchFoodsByName(
    @Path('foodName') String foodName,
    @Path('page') int page,
  );
}
