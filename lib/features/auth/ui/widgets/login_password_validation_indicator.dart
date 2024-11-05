import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/password_validation_indicator.dart';
import '../../logic/form_validation_provider.dart';

class LoginPasswordValidationIndicator extends StatefulWidget {
  const LoginPasswordValidationIndicator({super.key});

  @override
  State<StatefulWidget> createState() =>
      _LoginPasswordValidationIndicatorState();
}

class _LoginPasswordValidationIndicatorState
    extends State<LoginPasswordValidationIndicator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormValidationProvider>(
      builder: (context, formProvider, _) {
        final password = formProvider.passwordState.password;
        return PasswordValidationIndicator(password: password);
      },
    );
  }
}
