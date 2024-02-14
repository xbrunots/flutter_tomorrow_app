import 'package:dio/dio.dart';

import 'core/base_http_client.dart';

abstract class AppHttpClient extends BaseHttpClient {
  Future<Response<T>> post<T>({
    String? path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response<T>> get<T>({
    String? path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
