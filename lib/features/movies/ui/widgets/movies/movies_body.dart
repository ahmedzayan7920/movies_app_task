
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../logic/movies/movies_provider.dart';
import '../../../logic/movies/movies_state.dart';
import 'movies_list_view.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, provider, child) {
        final state = provider.state;
        switch (state) {
          case MoviesLoadingState():
            return Skeletonizer(
              enabled: true,
              child: MoviesListView(movies: provider.fakeMovies),
            );
          case MoviesLoadedState(:final movies):
            return MoviesListView(movies: movies);
          case MoviesErrorState(:final message):
            return Center(child: Text('Error: $message'));
        }
      },
    );
  }
}