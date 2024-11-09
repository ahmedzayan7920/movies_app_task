import '../../generated/l10n.dart';

abstract class AppStrings {
  static String get emailHint => S.current.emailFieldHint;
  static String get passwordHint => S.current.passwordFieldHint;

  static String get emailRequired => S.current.emailRequired;
  static String get emailInvalid => S.current.emailInvalid;
  static String get passwordRequired => S.current.passwordRequired;
  static String get atLeast8Chars => S.current.passwordRequirementAtLeast8Chars;
  static String get oneLowerLetter => S.current.passwordRequirementOneLowerCase;
  static String get oneUpperLetter => S.current.passwordRequirementOneUpperCase;
  static String get oneSpecialChar =>
      S.current.passwordRequirementOneSpecialChar;
  static String get oneNumber => S.current.passwordRequirementOneNumber;

  static String get login => S.current.loginButton;
  static String get invalidCredentials => S.current.errorInvalidCredentials;
}
