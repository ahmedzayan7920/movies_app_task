import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app_task/core/network/dio_cache_config.dart';
import 'package:movies_app_task/core/network/interceptors/auth_interceptor.dart';
import 'package:movies_app_task/core/network/interceptors/response_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/repos/auth_repository.dart';
import '../../features/auth/repos/auth_repository_impl.dart';
import '../localization/repos/language_repository.dart';
import '../localization/repos/language_repository_impl.dart';
import '../../features/movies/repos/movie_repository.dart';
import '../../features/movies/repos/movie_repository_impl.dart';
import '../network/dio_client.dart';
import '../network/dio_config.dart';
import '../network/interceptors/language_interceptor.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor());
  getIt.registerLazySingleton<LanguageInterceptor>(() => LanguageInterceptor());
  getIt.registerLazySingleton<ResponseInterceptor>(() => ResponseInterceptor());

  CacheOptions cacheOptions = await DioCacheConfig.getDefaultCacheOptions();
  getIt.registerLazySingleton<CacheOptions>(() => cacheOptions);

  getIt.registerLazySingleton<DioCacheInterceptor>(
      () => DioCacheInterceptor(options: getIt()));

  final dio = await DioConfig.createDio(interceptors: [
    getIt<AuthInterceptor>(),
    getIt<LanguageInterceptor>(),
    getIt<ResponseInterceptor>(),
    getIt<DioCacheInterceptor>(),
  ]);
  getIt.registerLazySingleton<DioClient>(() => DioClient(dio));

  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt<DioClient>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(sharedPreferences: getIt()));
}
