import 'package:flutter/material.dart';
import 'package:movies_app_task/core/utils/password_validator.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      labelText: AppStrings.passwordHint,
      prefixIcon: Icons.lock_outline,
      suffixIcon: _obscureText
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      onSuffixIconPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
      isPassword: true,
      validator: PasswordValidator.validate,
    );
  }
}
