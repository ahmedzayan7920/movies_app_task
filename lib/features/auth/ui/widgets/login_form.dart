import 'package:flutter/material.dart';
import 'package:movies_app_task/core/widgets/animated_logo.dart';
import 'package:provider/provider.dart';

import '../../logic/form_validation_provider.dart';
import 'login_button.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';
import 'login_password_validation_indicator.dart';

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
                  AnimatedLogo(),
                  SizedBox(height: 40),
                  LoginEmailField(),
                  SizedBox(height: 16),
                  LoginPasswordField(),
                  SizedBox(height: 16),
                  LoginPasswordValidationIndicator(),
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
