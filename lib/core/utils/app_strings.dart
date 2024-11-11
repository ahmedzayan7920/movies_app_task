import '../../generated/l10n.dart';

abstract class AppStrings {
  static String get emailHint => S.current.emailHint;
  static String get passwordHint => S.current.passwordHint;

  static String get emailRequired => S.current.emailRequired;
  static String get emailInvalid => S.current.emailInvalid;
  static String get passwordRequired => S.current.passwordRequired;
  static String get passwordMinLength => S.current.passwordMinLength;
  static String get passwordOneLowerCase => S.current.passwordOneLowerCase;
  static String get passwordOneUpperCase => S.current.passwordOneUpperCase;
  static String get passwordOneSpecialChar => S.current.passwordOneSpecialChar;
  static String get passwordOneNumber => S.current.passwordOneNumber;

  static String get loginButton => S.current.loginButton;
  static String get invalidCredentials => S.current.invalidCredentials;

  static String get englishLanguage => "English";
  static String get arabicLanguage => "العربية";

  static String get loadLanguageError => S.current.loadLanguageError;
  static String get saveLanguageError => S.current.saveLanguageError;

  static String get unexpectedError => S.current.unexpectedError;
  static String get expectedListError => S.current.expectedListError;
  static String get expectedMapError => S.current.expectedMapError;

  static String get requestTimeoutError => S.current.requestTimeoutError;
  static String get checkInternetError => S.current.checkInternetError;
  static String get serverError => S.current.serverError;
  static String get requestCancelledError => S.current.requestCancelledError;
  static String get unexpectedServerError => S.current.unexpectedServerError;

  static String get pullToRefresh => S.current.pullToRefresh;

  static String get releaseDate => S.current.releaseDate;
  static String get countries => S.current.countries;
  static String get languages => S.current.languages;
  static String get companies => S.current.companies;

  static String get settingsTitle => S.current.settingsTitle;
  static String get languageTitle => S.current.languageTitle;

  static String get popularMoviesTitle => S.current.popularMoviesTitle;
}
