import 'package:dio/dio.dart';

import '../../app/app_env.dart';
import '../api_keys.dart';

class AuthInterceptor extends Interceptor{
  AuthInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters[ApiKeys.apiKey] = AppEnv.apiKey;
    handler.next(options);
  }
}