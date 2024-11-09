import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app/app_routes.dart';
import '../../../../auth/logic/login_provider.dart';
import '../../../../auth/logic/login_state.dart';

class MoviesAppBar extends StatelessWidget {
  const MoviesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: loginProvider.state is LoginLoadingState
                ? null
                : () {
                    Scaffold.of(context).openDrawer();
                  },
            child: const Icon(Icons.menu_outlined)),
        const Text(
          'Popular Movies',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: loginProvider.state is LoginLoadingState
              ? null
              : () async {
                  await loginProvider.logout();
                  if (loginProvider.state is LoginInitialState &&
                      context.mounted) {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }
                },
          child: const Icon(Icons.logout_outlined),
        ),
      ],
    );
  }
}
