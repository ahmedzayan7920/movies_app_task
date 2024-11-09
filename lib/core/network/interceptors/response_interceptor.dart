import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  ResponseInterceptor();

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final dataKey = response.requestOptions.extra['dataKey'];
    if (dataKey != null && response.data is Map<String, dynamic>) {
      response.data = response.data[dataKey];
    }
    handler.next(response);
  }
}
