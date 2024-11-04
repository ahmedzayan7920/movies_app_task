import 'package:dio/dio.dart';
import '../app/app_env.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['api_key'] = AppEnv.apiKey;
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    final dataKey = response.requestOptions.extra['dataKey'];
    if (dataKey != null && response.data is Map<String, dynamic>) {
      response.data = response.data[dataKey];
    }
    handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.data is Map<String, dynamic>) {
      final errorData = err.response?.data as Map<String, dynamic>;
      final errorMessage = errorData['status_message'] ?? 'Unknown server error';
      handler.next(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: errorMessage,
          type: err.type,
        ),
      );
    } else {
      handler.next(err);
    }
  }
}
