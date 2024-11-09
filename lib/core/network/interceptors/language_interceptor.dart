import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_task/core/localization/repos/language_repository.dart';

class LanguageInterceptor extends Interceptor {
  final LanguageRepository _languageRepository;

  LanguageInterceptor({required LanguageRepository languageRepository})
      : _languageRepository = languageRepository;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final result = _languageRepository.getPreferredLanguage();
    final locale = result.fold(
      (failure) {
        return const Locale('en');
      },
      (r) {
        return r;
      },
    );
    options.queryParameters['language'] = locale.languageCode;
    handler.next(options);
  }
}
