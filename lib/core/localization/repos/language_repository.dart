import 'package:dartz/dartz.dart';
import 'dart:ui';

import '../../error/failure.dart';

abstract class LanguageRepository {
  Either<Failure, Locale> getPreferredLanguage();

  Future<Either<Failure, Unit>> saveLanguage(String languageCode);
}
