import 'package:get_it/get_it.dart';
import '../../features/auth/logic/form_validation_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/logic/login_provider.dart';
import '../../features/auth/repos/auth_repository.dart';
import '../../features/auth/repos/auth_repository_impl.dart';
import '../../features/movies/logic/movie_details/movie_details_provider.dart';
import '../../features/movies/logic/movies/movies_provider.dart';
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
  getIt.registerFactory<MoviesProvider>(
      () => MoviesProvider(getIt<MovieRepository>()));
  getIt.registerFactory<MovieDetailsProvider>(
      () => MovieDetailsProvider(getIt<MovieRepository>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<LoginProvider>(
      () => LoginProvider(authRepository: getIt<AuthRepository>()));
  getIt.registerFactory<FormValidationProvider>(() => FormValidationProvider());
}
