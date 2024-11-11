import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../api_keys.dart';

class LanguageInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters[ApiKeys.languageKey] = Intl.getCurrentLocale();
    handler.next(options);
  }
}
