import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> saveLoginStatus(bool status);
  Future<bool> isLoggedIn();
}