import 'app_strings.dart';

abstract class PasswordValidator {
  static const int minLength = 8;
  
  static final RegExp _lowercaseRegExp = RegExp(r'[a-z]');
  static final RegExp _uppercaseRegExp = RegExp(r'[A-Z]');
  static final RegExp _specialCharRegExp = RegExp(r'[!@#\$&*~]');
  static final RegExp _numberRegExp = RegExp(r'[0-9]');
  
  static bool hasMinLength(String password) => password.length >= minLength;
  static bool hasLowercase(String password) => _lowercaseRegExp.hasMatch(password);
  static bool hasUppercase(String password) => _uppercaseRegExp.hasMatch(password);
  static bool hasSpecialChar(String password) => _specialCharRegExp.hasMatch(password);
  static bool hasNumber(String password) => _numberRegExp.hasMatch(password);
  
  static String? validate(String? password) {
    if (password == null || password.isEmpty) return AppStrings.passwordRequired;
    if (!hasMinLength(password)) return AppStrings.passwordMinLength;
    if (!hasLowercase(password)) return AppStrings.passwordOneLowerCase;
    if (!hasUppercase(password)) return AppStrings.passwordOneUpperCase;
    if (!hasSpecialChar(password)) return AppStrings.passwordOneSpecialChar;
    if (!hasNumber(password)) return AppStrings.passwordOneNumber;
    return null;
  }
}