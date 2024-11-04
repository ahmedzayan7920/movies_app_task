import 'package:flutter/material.dart';

import '../../../models/movie_details_model.dart';

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
      style: TextStyle(
        color: Colors.grey[350],
      ),
    );
  }
}
