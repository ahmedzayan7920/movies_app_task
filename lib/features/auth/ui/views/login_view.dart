import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import 'package:provider/provider.dart';

import '../../logic/form_validation_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormValidationProvider(),
      child: const Scaffold(
        body: SafeArea(
          child: LoginForm(),
        ),
      ),
    );
  }
}
