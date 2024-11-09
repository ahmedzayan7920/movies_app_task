abstract class Failure {
  final String message;
  final int? statusCode;

  Failure({required this.message, this.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.statusCode});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required super.message});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.message});
}

class RequestCancelledFailure extends Failure {
  RequestCancelledFailure({required super.message});
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({required super.message, super.statusCode});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, super.statusCode});
}
class LanguageFailure extends Failure {
  LanguageFailure({required super.message, super.statusCode});
}
