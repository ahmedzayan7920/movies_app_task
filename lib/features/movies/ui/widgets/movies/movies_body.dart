import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_message.dart';
import '../../../logic/movies/movies_provider.dart';
import '../../../logic/movies/movies_state.dart';
import 'movies_list_view.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, provider, child) {
        final state = provider.state;
        return RefreshIndicator(
          onRefresh: () => provider.loadPopularMovies(),
          child: Builder(
            builder: (context) {
              switch (state) {
                case MoviesLoadingState():
                  return Skeletonizer(
                    enabled: true,
                    child: MoviesListView(movies: provider.fakeMovies),
                  );
                case MoviesLoadedState(
                    :final moviesResource,
                    :final isLoadingMore,
                    :final error
                  ):
                  return Column(
                    children: [
                      Expanded(
                        child: MoviesListView(
                          movies: moviesResource.data,
                          isLoadingMore: isLoadingMore,
                          onLoadMore: provider.loadMoreMovies,
                        ),
                      ),
                      if (error != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            error,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                    ],
                  );
                case MoviesErrorState(:final message):
                  return CustomErrorMessage(message: message);
              }
            },
          ),
        );
      },
    );
  }
}
