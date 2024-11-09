import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import '../../../core/error/failure.dart';
import 'language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final SharedPreferences _sharedPreferences;
  static const String _languageCodeKey = 'languageCode';

  LanguageRepositoryImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Either<Failure, Locale> getPreferredLanguage() {
    try {
      final languageCode = _sharedPreferences.getString(_languageCodeKey);

      if (languageCode != null) {
        return Right(Locale(languageCode));
      } else {
        return Right(PlatformDispatcher.instance.locale);
      }
    } catch (e) {
      return Left(
          LanguageFailure(message: "Failed to load preferred language"));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage(String languageCode) async {
    try {
      await _sharedPreferences.setString(_languageCodeKey, languageCode);
      return const Right(unit);
    } catch (e) {
      return Left(
          LanguageFailure(message: "Failed to save preferred language"));
    }
  }
}
