import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:procal/services/api/clients/procal_client.dart';
import 'package:procal/services/api/models/food/food.dart';
import 'package:procal/services/api/models/food/foods_search.dart';
import 'package:procal/services/api/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'procal_service.g.dart';

@riverpod
class ProcalService extends _$ProcalService {
  final _client = ProcalClient(
    Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? 'https://procal-api.fly.dev/api/',
        connectTimeout: const Duration(seconds: 20),
        contentType: Headers.jsonContentType,
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (_) => true,
      ),
    ),
    baseUrl: dotenv.env['BASE_URL'] ?? 'https://procal-api.fly.dev/api/',
  );
  @override
  void build() {}

  Future<FatSecretFood> getFoodById(String id) async => _client.getFoodById(id);

  Future<FatSecretFood> getFoodByBarcode(String barcode) async =>
      _client.getFoodByBarcode(barcode);

  Future<FoodsSearchData> searchFoodsByName(String foodName, int page) async =>
      _client.searchFoodsByName(foodName.split(' ').join('+'), page);

  Future<User> createUser(User user) async => _client.createUser(user);
  Future<User> getUserById(String id) async => _client.getUserById(id);
  Future<User?> getUserByEmail(String email) async => _client
      .getUserByEmail(email)
      .then((response) => response.data)
      .catchError((error) {
        print('Error fetching user by email: $error');
        return null;
      });
}
