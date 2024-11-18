import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../auth/logic/login_event.dart';
import '../../../../auth/logic/login_bloc.dart';
import '../../../../auth/logic/login_state.dart';

class MoviesAppBar extends StatelessWidget {
  const MoviesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitialState) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: isLoading
                  ? null
                  : () {
                      Scaffold.of(context).openDrawer();
                    },
              child: const Icon(Icons.menu_outlined),
            ),
            Text(
              AppStrings.popularMoviesTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            GestureDetector(
              onTap: isLoading
                  ? null
                  : () {
                      context.read<LoginBloc>().add(LogoutRequestEvent());
                    },
              child: const Icon(Icons.logout_outlined),
            ),
          ],
        );
      },
    );
  }
}
