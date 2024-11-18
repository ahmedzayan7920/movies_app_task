import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/language_repository.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageRepository _languageRepository;

  LanguageCubit({required LanguageRepository languageRepository})
      : _languageRepository = languageRepository,
        super(LanguageLoading());

  void loadPreferredLanguage() {
    final result = _languageRepository.getPreferredLanguage();
    result.fold(
      (failure) => emit(LanguageError(failure.message)),
      (locale) => emit(LanguageLoaded(locale)),
    );
  }

  Future<void> changeLanguage({required String languageCode}) async {
    final result = await _languageRepository.saveLanguage(languageCode);
    result.fold(
      (failure) => emit(LanguageError(failure.message)),
      (_) => emit(LanguageLoaded(Locale(languageCode))),
    );
  }
}
