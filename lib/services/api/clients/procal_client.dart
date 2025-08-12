import 'package:dio/dio.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:procal/services/api/models/food/foods_search.dart';
import 'package:procal/services/api/models/goal/goal.dart';
import 'package:procal/services/api/models/user/procal_user.dart';
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
  Future<FoodsSearchData> searchFoodsByName(
    @Path('foodName') String foodName,
    @Path('page') int page,
  );

  @POST('/user')
  Future<ProcalUser> createUser(@Body() ProcalUser user);

  @GET('/user/{id}')
  Future<ProcalUser> getUserById(@Path('id') String id);

  @GET('/user/email/{email}')
  Future<HttpResponse<ProcalUser?>> getUserByEmail(@Path('email') String email);

  @GET('/user/uid/{firebaseUid}')
  Future<ProcalUser?> getUserByUid(@Path('firebaseUid') String firebaseUid);

  @PUT('/user')
  Future<ProcalUser> updateUser(@Body() ProcalUser user);

  @GET('/goal/{userId}')
  Future<Goal> getGoalByUserId(@Path('userId') String userId);

  @POST('/goal')
  Future<Goal> createGoal(@Body() Goal goal);

  @PUT('/goal')
  Future<Goal> updateGoal(@Body() Goal goal);

  @DELETE('/goal/{userId}')
  Future<void> deleteGoal(@Path('userId') String userId);
}
