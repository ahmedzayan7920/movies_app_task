import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class LanguageInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['language'] = Intl.getCurrentLocale();
    handler.next(options);
  }
}
