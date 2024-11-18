abstract class LanguageEvent {}

class LoadPreferredLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final String languageCode;

  ChangeLanguageEvent(this.languageCode);
}
