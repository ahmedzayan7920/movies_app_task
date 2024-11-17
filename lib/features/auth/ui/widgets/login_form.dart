import 'package:flutter/material.dart';

import '../../../../core/widgets/animated_logo.dart';
import '../../../../core/widgets/password_validation_indicator.dart';
import 'login_button.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _shouldValidate = false;

  void _enableValidation() {
    setState(() {
      _shouldValidate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _shouldValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AnimatedLogo(),
              const SizedBox(height: 40),
              LoginEmailField(controller: _emailController),
              const SizedBox(height: 16),
              LoginPasswordField(controller: _passwordController),
              const SizedBox(height: 16),
              PasswordValidationIndicator(controller: _passwordController),
              const SizedBox(height: 32),
              LoginButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                onValidationRequested: _enableValidation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
