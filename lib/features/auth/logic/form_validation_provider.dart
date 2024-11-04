import 'package:flutter/material.dart';

import '../../../core/utils/email_validator.dart';
import '../../../core/utils/password_validator.dart';
import 'form_validation_state.dart';
import 'password_validation_state.dart';

class FormValidationProvider extends ChangeNotifier {
  FormValidationState _state = const FormInitialState();
  FormValidationState get state => _state;

  PasswordValidationState _passwordState = PasswordValidationState.initial();
  PasswordValidationState get passwordState => _passwordState;

  String _email = '';
  String get email => _email;

  bool _shouldValidate = false;
  bool get shouldValidate => _shouldValidate;

  void enableValidation() {
    _shouldValidate = true;
    _validateForm();
  }

  void onEmailChanged(String email) {
    _email = email;
    if (_shouldValidate) {
      _validateForm();
    }
  }

  void onPasswordChanged(String password) {
    _passwordState = PasswordValidationState(
      password: password,
      hasMinLength: PasswordValidator.hasMinLength(password),
      hasLowercase: PasswordValidator.hasLowercase(password),
      hasUppercase: PasswordValidator.hasUppercase(password),
      hasSpecialChar: PasswordValidator.hasSpecialChar(password),
      hasNumber: PasswordValidator.hasNumber(password),
      isValid: PasswordValidator.validate(password) == null,
    );
    if (_shouldValidate) {
      _validateForm();
    }
    notifyListeners();
  }

  void _validateForm() {
    final Map<String, String> errors = {};

    final emailError = EmailValidator.validate(_email);
    if (emailError != null) {
      errors['email'] = emailError;
    }

    final passwordError = PasswordValidator.validate(_passwordState.password);
    if (passwordError != null) {
      errors['password'] = passwordError;
    }

    if (errors.isEmpty) {
      _state = const FormValidState();
    } else {
      _state = FormInvalidState(errors);
    }

    notifyListeners();
  }
}
