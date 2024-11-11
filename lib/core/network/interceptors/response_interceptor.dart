import 'package:dio/dio.dart';
import '../api_keys.dart';

class ResponseInterceptor extends Interceptor {
  ResponseInterceptor();

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final dataKey = response.requestOptions.extra[ApiKeys.responseDataKey];
    if (dataKey != null && response.data is Map<String, dynamic>) {
      response.data = response.data[dataKey];
    }
    handler.next(response);
  }
}
