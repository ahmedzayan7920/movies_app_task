import 'package:dio/dio.dart';
import '../error/failure.dart';

Failure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure();
    case DioExceptionType.connectionError:
      return ConnectionFailure();
    case DioExceptionType.badResponse:
      final message = error.response?.data?['status_message'] ?? 'Unexpected server error';
      return ServerFailure(
        message: message,
        statusCode: error.response?.statusCode,
      );
    default:
      return ServerFailure(
        message: error.message ?? 'Unknown error occurred',
        statusCode: error.response?.statusCode,
      );
  }
}
