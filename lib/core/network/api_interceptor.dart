import 'package:dio/dio.dart';

import '../app/app_env.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['api_key'] = AppEnv.apiKey;
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    final dataKey = response.requestOptions.extra['dataKey'];
    if (dataKey != null && response.data is Map<String, dynamic>) {
      response.data = response.data[dataKey];
    }
    handler.next(response);
  }
}
