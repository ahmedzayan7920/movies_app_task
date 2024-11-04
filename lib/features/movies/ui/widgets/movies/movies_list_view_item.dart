import 'package:flutter/material.dart';

import '../../../models/movie_model.dart';
import '../common/blurred_background_image.dart';
import '../common/movie_overview.dart';
import '../common/movie_poster_image.dart';
import '../common/movie_rating_row.dart';
import '../common/movie_title.dart';

class MoviesListViewItem extends StatelessWidget {
  const MoviesListViewItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BlurredBackgroundImage(
          imageUrl: movie.backdropImage,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                MoviePosterImage(imageUrl: movie.posterImage),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MovieTitle(title: movie.title),
                          ),
                          MovieRatingRow(
                            voteAverage: movie.voteAverage,
                            voteCount: movie.voteCount,
                          ),
                        ],
                      ),
                      MovieOverview(
                        overview: movie.overview,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
