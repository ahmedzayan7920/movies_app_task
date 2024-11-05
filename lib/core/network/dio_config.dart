import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../app/app_env.dart';
import 'api_interceptor.dart';
import 'dio_cache_config.dart';

abstract class DioConfig {
  static Future<Dio> createDio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEnv.baseUrl ?? "",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    final cacheOptions = await DioCacheConfig.getDefaultCacheOptions();
    dio.interceptors.addAll([
      ApiInterceptor(),
      DioCacheInterceptor(options: cacheOptions),
    ]);

    return dio;
  }
}
