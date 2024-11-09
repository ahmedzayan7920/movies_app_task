import 'package:flutter/material.dart';
import 'package:movies_app_task/features/movies/models/movie_model.dart';
import '../common/movie_overview.dart';
import '../common/movie_poster_image.dart';
import '../common/movie_title.dart';

import '../common/blurred_background_image.dart';
import '../common/movie_rating_row.dart';
import 'movie_genres.dart';
import 'movie_rich_text.dart';

class MovieDetailsItem extends StatelessWidget {
  const MovieDetailsItem({super.key, required this.movieDetails});
  final MovieModel movieDetails;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlurredBackgroundImage(
      imageUrl: movieDetails.posterImage,
      withBackArrow: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: size.height * 0.3,
                child: MoviePosterImage(imageUrl: movieDetails.posterImage),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: MovieTitle(title: movieDetails.title),
                  ),
                  const SizedBox(width: 10),
                  MovieRatingRow(
                    voteAverage: movieDetails.voteAverage,
                    voteCount: movieDetails.voteCount,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: MovieGenres(genres: movieDetails.genres??[]),
            ),
            const SizedBox(height: 10),
            MovieOverview(overview: movieDetails.overview),
            const SizedBox(height: 10),
            MovieRichText(
              title: "Release Date: ",
              value: movieDetails.releaseDate,
            ),
            MovieRichText(
              title: "Countries: ",
              value: (movieDetails.productionCountries?.map((e) => e.name).join(', ')) ?? 'N/A',
            ),
            MovieRichText(
              title: "Languages: ",
              value: movieDetails.spokenLanguages?.map((e) => e.name).join(', ') ?? 'N/A',
            ),
            MovieRichText(
              title: "Companies: ",
              value: movieDetails.productionCompanies
              ?.map((e) => e.name)
              .join(', ') ?? 'N/A',
            ),
          ],
        ),
      ),
    );
  }
}

