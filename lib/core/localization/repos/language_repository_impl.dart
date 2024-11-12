import 'dart:ui';

import 'package:dartz/dartz.dart';
import '../../utils/app_keys.dart';
import '../../utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../error/failure.dart';
import 'language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final SharedPreferences _sharedPreferences;

  LanguageRepositoryImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Either<Failure, Locale> getPreferredLanguage() {
    try {
      final languageCode = _sharedPreferences.getString(AppKeys.languageCode);

      if (languageCode != null) {
        return Right(Locale(languageCode));
      } else {
        return Right(PlatformDispatcher.instance.locale);
      }
    } catch (e) {
      return Left(
          LanguageFailure(message: AppStrings.loadLanguageError));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage(String languageCode) async {
    try {
      await _sharedPreferences.setString(AppKeys.languageCode, languageCode);
      return const Right(unit);
    } catch (e) {
      return Left(
          LanguageFailure(message: AppStrings.saveLanguageError));
    }
  }
}
