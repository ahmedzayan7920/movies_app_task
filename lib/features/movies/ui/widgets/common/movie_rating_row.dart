import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/themes/app_colors.dart';

class MovieRatingRow extends StatelessWidget {
  const MovieRatingRow({
    super.key,
    required this.voteAverage,
    required this.voteCount,
  });

  final double voteAverage;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.shade(
          child: Icon(
            Icons.star_rounded,
            color: AppColors.yellow,
          ),
        ),
        Text(
          voteAverage.toStringAsFixed(1),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(width: 5),
        Text(
          '($voteCount)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.greyLight,
              ),
        ),
      ],
    );
  }
}
