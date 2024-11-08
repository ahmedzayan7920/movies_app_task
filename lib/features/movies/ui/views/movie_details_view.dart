import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app/di.dart';
import '../../logic/movie_details/movie_details_provider.dart';
import '../../logic/movie_details/movie_details_state.dart';
import '../widgets/movie_details/movie_details_item.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt<MovieDetailsProvider>()..loadMovieDetails(movieId: movieId),
      child: Scaffold(
        body: Consumer<MovieDetailsProvider>(
          builder: (context, provider, child) {
            final state = provider.state;
            switch (state) {
              case MovieDetailsLoadingState():
                return Skeletonizer(
                  enabled: true,
                  child: MovieDetailsItem(
                    movieDetails: provider.fakeMovieDetails,
                  ),
                );
              case MovieDetailsLoadedState(:final movieDetails):
                return MovieDetailsItem(movieDetails: movieDetails);
              case MovieDetailsErrorState(:final message):
                return Center(child: Text('Error: $message'));
            }
          },
        ),
      ),
    );
  }
}
