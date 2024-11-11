import 'app_strings.dart';

class EmailValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  static String? validate(String? email) {
    if (email == null || email.isEmpty) return AppStrings.emailRequired;
    if (!_emailRegExp.hasMatch(email)) return AppStrings.emailInvalid;
    return null;
  }
}
