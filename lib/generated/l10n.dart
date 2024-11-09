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
  String get emailFieldHint {
    return Intl.message(
      'Email',
      name: 'emailFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordFieldHint {
    return Intl.message(
      'Password',
      name: 'passwordFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get passwordRequirementAtLeast8Chars {
    return Intl.message(
      'At least 8 characters',
      name: 'passwordRequirementAtLeast8Chars',
      desc: '',
      args: [],
    );
  }

  /// `One lowercase letter`
  String get passwordRequirementOneLowerCase {
    return Intl.message(
      'One lowercase letter',
      name: 'passwordRequirementOneLowerCase',
      desc: '',
      args: [],
    );
  }

  /// `One uppercase letter`
  String get passwordRequirementOneUpperCase {
    return Intl.message(
      'One uppercase letter',
      name: 'passwordRequirementOneUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `One special character`
  String get passwordRequirementOneSpecialChar {
    return Intl.message(
      'One special character',
      name: 'passwordRequirementOneSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `One number`
  String get passwordRequirementOneNumber {
    return Intl.message(
      'One number',
      name: 'passwordRequirementOneNumber',
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
  String get errorInvalidCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'errorInvalidCredentials',
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
