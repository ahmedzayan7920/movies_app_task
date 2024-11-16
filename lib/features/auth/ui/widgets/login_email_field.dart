import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/email_validator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: AppStrings.emailHint,
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: EmailValidator.validate,
    );
  }
}
