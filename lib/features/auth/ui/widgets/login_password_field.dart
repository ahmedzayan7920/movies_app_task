import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/form_validation_provider.dart';
import '../../logic/form_validation_state.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
  });

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<FormValidationProvider>(
      builder: (context, formProvider, _) {
        final formState = formProvider.state;
        return CustomTextFormField(
          labelText: 'Password',
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
          onChanged: formProvider.onPasswordChanged,
          obscureText: _obscureText,
          isPassword: true,
          errorText: formState is FormInvalidState
              ? formState.errors['password']
              : null,
        );
      },
    );
  }
}
