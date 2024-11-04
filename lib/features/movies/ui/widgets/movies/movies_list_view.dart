import 'package:flutter/material.dart';
import '../../../../../core/app/app_routes.dart';
import '../../../models/movie_model.dart';

import 'movies_list_view_item.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.movies});
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              MovieModel movie = movies[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.movieDetails,
                      arguments: movie.id);
                },
                child: MoviesListViewItem(
                  movie: movie,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
