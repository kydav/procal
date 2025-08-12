import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('request: ${options.path}');
    debugPrint(options.data.toString());
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final emoji = switch (response.statusCode) {
      != null && >= 200 && < 300 => '✅',
      != null && >= 300 && < 400 => '🟠',
      _ => '❌',
    };
    debugPrint(
      '$emoji ${response.statusCode ?? ''} $emoji ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }
}
