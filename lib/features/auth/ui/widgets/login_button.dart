import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../logic/login_cubit.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;
        return CustomElevatedButton(
          onPressed: isLoading ? null : () => _login(context),
          isLoading: isLoading,
          text: AppStrings.loginButton,
        );
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    final loginCubit = context.read<LoginCubit>();

    onValidationRequested();
    if (formKey.currentState?.validate() == true) {
      loginCubit.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
