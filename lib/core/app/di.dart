import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/repos/auth_repository.dart';
import '../../features/auth/repos/auth_repository_impl.dart';
import '../../features/localization/repos/language_repository.dart';
import '../../features/localization/repos/language_repository_impl.dart';
import '../../features/movies/repos/movie_repository.dart';
import '../../features/movies/repos/movie_repository_impl.dart';
import '../network/dio_client.dart';
import '../network/dio_config.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  final dio = await DioConfig.createDio();
  getIt.registerLazySingleton<DioClient>(() => DioClient(dio));

  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt<DioClient>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(sharedPreferences: getIt()));
}
