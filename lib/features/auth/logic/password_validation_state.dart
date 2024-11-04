class PasswordValidationState {
  final String password;
  final bool hasMinLength;
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialChar;
  final bool hasNumber;
  final bool isValid;

  const PasswordValidationState({
    required this.password,
    required this.hasMinLength,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.isValid,
  });

  factory PasswordValidationState.initial() {
    return const PasswordValidationState(
      password: '',
      hasMinLength: false,
      hasLowercase: false,
      hasUppercase: false,
      hasSpecialChar: false,
      hasNumber: false,
      isValid: false,
    );
  }
}