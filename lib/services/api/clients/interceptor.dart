import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.data != null) {
      debugPrint('***Request Data***');
      debugPrint(options.data.toString());
    }
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
      '$emoji ${response.statusCode ?? ''} $emoji  ${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    if (response.data != null) {
      debugPrint('***Response***');
      debugPrint(response.data.toString());
    }
    super.onResponse(response, handler);
  }
}
