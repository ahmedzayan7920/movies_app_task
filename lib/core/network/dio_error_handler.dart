import 'package:dio/dio.dart';
import '../utils/app_strings.dart';

import '../error/failure.dart';

Failure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure(
          message: AppStrings.requestTimeoutError);

    case DioExceptionType.connectionError:
      return ConnectionFailure(
          message: AppStrings.checkInternetError);

    case DioExceptionType.badResponse:
      final message =
          error.response?.data?['status_message'] ?? AppStrings.serverError;
      return ServerFailure(
        message: message,
        statusCode: error.response?.statusCode,
      );

    case DioExceptionType.cancel:
      return RequestCancelledFailure(
          message: AppStrings.requestCancelledError);

    default:
      return UnexpectedFailure(
        message: error.message ?? AppStrings.unexpectedServerError,
        statusCode: error.response?.statusCode,
      );
  }
}
