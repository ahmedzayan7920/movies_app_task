import 'package:flutter/material.dart';
import 'package:movies_app_task/core/utils/app_strings.dart';
import 'package:provider/provider.dart';

import '../../../../core/app/app_routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../logic/form_validation_provider.dart';
import '../../logic/form_validation_state.dart';
import '../../logic/login_provider.dart';
import '../../logic/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        final isLoading = loginProvider.state is LoginLoadingState;
        return CustomElevatedButton(
          onPressed: isLoading ? null : () => _login(context),
          isLoading: isLoading,
          text: AppStrings.login,
        );
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    final formProvider = context.read<FormValidationProvider>();
    final loginProvider = context.read<LoginProvider>();

    formProvider.enableValidation();

    if (formProvider.state is! FormValidState) {
      return;
    }

    await loginProvider.login(
      formProvider.email,
      formProvider.passwordState.password,
    );

    if (loginProvider.state is LoginSuccessState) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.movies);
      }
    } else if (loginProvider.state is LoginFailureState && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text((loginProvider.state as LoginFailureState).message),
        ),
      );
    }
  }
}
