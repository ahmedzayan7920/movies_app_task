// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get emailInvalid {
    return Intl.message(
      'Enter a valid email',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Must contain a lowercase letter`
  String get passwordOneLowerCase {
    return Intl.message(
      'Must contain a lowercase letter',
      name: 'passwordOneLowerCase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain an uppercase letter`
  String get passwordOneUpperCase {
    return Intl.message(
      'Must contain an uppercase letter',
      name: 'passwordOneUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain a special character`
  String get passwordOneSpecialChar {
    return Intl.message(
      'Must contain a special character',
      name: 'passwordOneSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one number`
  String get passwordOneNumber {
    return Intl.message(
      'Must contain at least one number',
      name: 'passwordOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalidCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabicLanguage {
    return Intl.message(
      'Arabic',
      name: 'arabicLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load preferred language`
  String get loadLanguageError {
    return Intl.message(
      'Failed to load preferred language',
      name: 'loadLanguageError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to save preferred language`
  String get saveLanguageError {
    return Intl.message(
      'Failed to save preferred language',
      name: 'saveLanguageError',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error: `
  String get unexpectedError {
    return Intl.message(
      'Unexpected error: ',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Expected a List but got `
  String get expectedListError {
    return Intl.message(
      'Expected a List but got ',
      name: 'expectedListError',
      desc: '',
      args: [],
    );
  }

  /// `Expected Map but got `
  String get expectedMapError {
    return Intl.message(
      'Expected Map but got ',
      name: 'expectedMapError',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again later.`
  String get requestTimeoutError {
    return Intl.message(
      'Request timed out. Please try again later.',
      name: 'requestTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection.`
  String get checkInternetError {
    return Intl.message(
      'Please check your internet connection.',
      name: 'checkInternetError',
      desc: '',
      args: [],
    );
  }

  /// `Server error occurred.`
  String get serverError {
    return Intl.message(
      'Server error occurred.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was cancelled.`
  String get requestCancelledError {
    return Intl.message(
      'Request to server was cancelled.',
      name: 'requestCancelledError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get unexpectedServerError {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'unexpectedServerError',
      desc: '',
      args: [],
    );
  }

  /// `Pull down to refresh.`
  String get pullToRefresh {
    return Intl.message(
      'Pull down to refresh.',
      name: 'pullToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `Release Date: `
  String get releaseDate {
    return Intl.message(
      'Release Date: ',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Countries: `
  String get countries {
    return Intl.message(
      'Countries: ',
      name: 'countries',
      desc: '',
      args: [],
    );
  }

  /// `Languages: `
  String get languages {
    return Intl.message(
      'Languages: ',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Companies: `
  String get companies {
    return Intl.message(
      'Companies: ',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageTitle {
    return Intl.message(
      'Language',
      name: 'languageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Popular Movies`
  String get popularMoviesTitle {
    return Intl.message(
      'Popular Movies',
      name: 'popularMoviesTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
