import 'package:dio/dio.dart';

import '../../app/app_env.dart';

class AuthInterceptor extends Interceptor{
  AuthInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['api_key'] = AppEnv.apiKey;
    handler.next(options);
  }
}