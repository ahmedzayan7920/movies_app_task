import 'dart:ui';

sealed class LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;
  LanguageLoaded(this.locale);
}

class LanguageError extends LanguageState {
  final String errorMessage;
  LanguageError(this.errorMessage);
}
