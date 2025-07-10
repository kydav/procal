import 'package:dio/dio.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:retrofit/retrofit.dart';

part 'procal_client.g.dart';

@RestApi()
abstract class ProcalClient {
  factory ProcalClient(Dio dio, {String baseUrl}) = _ProcalClient;

  @GET('/food/{barcode}/barcode')
  Future<ReturnFood> getFoodByBarcode(@Path('barcode') String barcode);

  @POST('/food/{foodName}/search/2')
  Future<List<ReturnFood>> searchFoodsByName(@Path('foodName') String foodName);
}
