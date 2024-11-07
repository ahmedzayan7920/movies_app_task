import 'package:dio/dio.dart';

import '../error/failure.dart';

Failure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure(
          message: 'Request timed out. Please try again later.');

    case DioExceptionType.connectionError:
      return ConnectionFailure(
          message: 'Please check your internet connection.');

    case DioExceptionType.badResponse:
      final message =
          error.response?.data?['status_message'] ?? 'Server error occurred.';
      return ServerFailure(
        message: message,
        statusCode: error.response?.statusCode,
      );

    case DioExceptionType.cancel:
      return RequestCancelledFailure(
          message: 'Request to server was cancelled.');

    default:
      return UnexpectedFailure(
        message: error.message ?? 'An unexpected error occurred.',
        statusCode: error.response?.statusCode,
      );
  }
}
