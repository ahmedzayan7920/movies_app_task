import 'package:flutter/material.dart';

import '../repos/language_repository.dart';
import 'language_state.dart';

class LanguageProvider extends ChangeNotifier {
  final LanguageRepository _languageRepository;
  LanguageState _state = LanguageLoading();

  LanguageProvider({required LanguageRepository languageRepository})
      : _languageRepository = languageRepository {
    _loadPreferredLanguage();
  }
  final List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'label': 'English'},
    {'code': 'ar', 'label': 'Arabic'},
  ];

  LanguageState get state => _state;

  void _loadPreferredLanguage() {
    final result = _languageRepository.getPreferredLanguage();
    result.fold(
      (failure) {
         _state = LanguageError(failure.message);
      },
      (locale) {
         _state = LanguageLoaded(locale);
      },
    );
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    final result = await _languageRepository.saveLanguage(languageCode);
    result.fold(
      (failure) => _state = LanguageError(failure.message),
      (_) => _state = LanguageLoaded(Locale(languageCode)),
    );
    notifyListeners();
  }
}
