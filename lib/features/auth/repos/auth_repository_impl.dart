import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_keys.dart';
import '../../../core/utils/app_strings.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences _sharedPreferences;

  AuthRepositoryImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (email == AppConstants.mockEmail &&
          password == AppConstants.mockPassword) {
        await saveLoginStatus(true);
        return const Right(true);
      }
      return Left(ServerFailure(message: AppStrings.invalidCredentials));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await saveLoginStatus(false);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLoginStatus(bool status) async {
    try {
      await _sharedPreferences.setBool(AppKeys.isLoggedIn, status);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return _sharedPreferences.getBool(AppKeys.isLoggedIn) ?? false;
  }
}
