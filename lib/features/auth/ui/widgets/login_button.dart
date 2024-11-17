import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../logic/login_provider.dart';
import '../../logic/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onValidationRequested,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onValidationRequested;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        final isLoading = loginProvider.state is LoginLoadingState;
        return CustomElevatedButton(
          onPressed: isLoading ? null : () => _login(context),
          isLoading: isLoading,
          text: AppStrings.loginButton,
        );
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    final loginProvider = context.read<LoginProvider>();

    onValidationRequested();
    if (formKey.currentState?.validate() == true) {
      await loginProvider.login(
        emailController.text,
        passwordController.text,
      );

      if (loginProvider.state is LoginSuccessState) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.movies);
        }
      } else if (loginProvider.state is LoginFailureState && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text((loginProvider.state as LoginFailureState).message),
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
