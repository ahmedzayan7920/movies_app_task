abstract class Failure {
  final String message;
  final int? statusCode;

  Failure({required this.message, this.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.statusCode});
}

class ConnectionFailure extends Failure {
  ConnectionFailure() : super(message: 'No internet connection');
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super(message: 'Connection timeout');
}


class CacheFailure extends Failure {
  CacheFailure({required super.message, super.statusCode});
}
