import 'package:dio/dio.dart';

import '../app/app_env.dart';

abstract class DioConfig {
  DioConfig._();
  static Future<Dio> createDio(
      {required List<Interceptor> interceptors}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEnv.baseUrl ?? "",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
