import 'package:flutter/material.dart';
import 'package:movies_app_task/core/themes/app_colors.dart';

import '../../../models/movie_model.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Text(
      genres.map((e) => e.name).join(' | '),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.greyLight,
      ),
    );
  }
}
