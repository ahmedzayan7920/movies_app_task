abstract class LanguageEvent {}

class LoadPreferredLanguage extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);
}
