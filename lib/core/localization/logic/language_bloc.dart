import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/language_repository.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository _languageRepository;

  LanguageBloc({required LanguageRepository languageRepository})
      : _languageRepository = languageRepository,
        super(LanguageLoading()) {
    on<LoadPreferredLanguage>(_onLoadPreferredLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  void _onLoadPreferredLanguage(
      LoadPreferredLanguage event, Emitter<LanguageState> emit) {
    final result = _languageRepository.getPreferredLanguage();
    result.fold(
      (failure) => emit(LanguageError(failure.message)),
      (locale) => emit(LanguageLoaded(locale)),
    );
  }

  Future<void> _onChangeLanguage(
      ChangeLanguage event, Emitter<LanguageState> emit) async {
    final result = await _languageRepository.saveLanguage(event.languageCode);
    result.fold(
      (failure) => emit(LanguageError(failure.message)),
      (_) => emit(LanguageLoaded(Locale(event.languageCode))),
    );
  }
}
