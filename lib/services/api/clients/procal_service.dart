import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:procal/services/api/clients/procal_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'procal_service.g.dart';

@riverpod
class ProcalService extends _$ProcalService {
  @override
  ProcalClient build() => ProcalClient(
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
}
