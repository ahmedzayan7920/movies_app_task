import 'package:dio/dio.dart';

class ApiError {
  final int statusCode;
  final String statusMessage;

  ApiError({required this.statusCode, required this.statusMessage});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}

abstract class ApiException implements Exception {
  final String messageKey;
  ApiException(this.messageKey);
}

class BadRequestException extends ApiException {
  BadRequestException() : super("badRequest");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super("unauthorized");
}

class NotFoundException extends ApiException {
  NotFoundException() : super("notFound");
}

class ServerException extends ApiException {
  ServerException() : super("serverError");
}

class UnknownException extends ApiException {
  UnknownException() : super("unknownError");
}

class ApiErrorParser {
  static ApiException parseError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final responseData = error.response!.data;

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('status_message')) {
        final apiError = ApiError.fromJson(responseData);
        return _getExceptionForStatusCode(apiError, statusCode);
      }
      return _getGenericExceptionForStatusCode(statusCode);
    }
    return UnknownException();
  }

  static ApiException _getExceptionForStatusCode(
      ApiError apiError, int? statusCode) {
    switch (statusCode) {
      case 400:
        return BadRequestException();
      case 401:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return UnknownException();
    }
  }

  static ApiException _getGenericExceptionForStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return BadRequestException();
      case 401:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return UnknownException();
    }
  }
}
