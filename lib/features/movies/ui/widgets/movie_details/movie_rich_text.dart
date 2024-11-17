import 'package:flutter/material.dart';
import 'package:movies_app_task/core/themes/app_colors.dart';

class MovieRichText extends StatelessWidget {
  const MovieRichText({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.greyLight,
            ),
          ),
        ],
      ),
    );
  }
}
