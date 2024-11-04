import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_error.dart';
import 'api_response.dart';
import 'app_logger.dart';
import 'base_api_service.dart';

class DioClient implements BaseApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api_key'] = dotenv.env['API_KEY'];
          AppLogger.logInfo("Requesting ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.logInfo("Response received: ${response.data}");
          handler.next(response); 
        },
        onError: (DioException exception, handler) {
          
          ApiException apiException = ApiErrorParser.parseError(exception);

          
          final newException = DioException(
            requestOptions: exception.requestOptions,
            response: exception.response,
            type: exception.type,
            error: apiException,
          );

          
          AppLogger.logError("Error: ${apiException.messageKey}");
          handler.next(newException);
        },
      ),
    );
  }

  @override
  Future<ApiResponse<T>> getRequest<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T); 
    } on DioException catch (dioException) {
      if (dioException.error is ApiException) {
        final apiException = dioException.error as ApiException;
        return ApiResponse.failure(apiException.messageKey);
      }
      return ApiResponse.failure("unknownError");
    } catch (e) {
      return ApiResponse.failure("unknownError");
    }
  }
}
