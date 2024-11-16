import 'package:flutter/material.dart';
import '../utils/app_strings.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '$message\n${AppStrings.pullToRefresh}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
