import 'package:flutter/material.dart';
import 'login_button.dart';
import 'package:provider/provider.dart';

import '../../logic/form_validation_provider.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';
import 'password_validation_indicator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormValidationProvider>(
      builder: (context, formProvider, _) {
        return const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginEmailField(),
                  SizedBox(height: 16),
                  LoginPasswordField(),
                  SizedBox(height: 16),
                  PasswordValidationIndicator(),
                  SizedBox(height: 32),
                  LoginButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
