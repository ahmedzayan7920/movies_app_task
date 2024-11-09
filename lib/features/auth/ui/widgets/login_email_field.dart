import 'package:flutter/material.dart';
import 'package:movies_app_task/core/utils/app_keys.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/form_validation_provider.dart';
import '../../logic/form_validation_state.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FormValidationProvider>(
      builder: (context, formProvider, _) {
        final formState = formProvider.state;
        return CustomTextFormField(
          labelText: AppStrings.emailHint,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: formProvider.onEmailChanged,
          errorText: formState is FormInvalidState
              ? formState.errors[AppKeys.email]
              : null,
        );
      },
    );
  }
}
