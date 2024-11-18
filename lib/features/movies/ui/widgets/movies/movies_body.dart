import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../logic/movies/movies_cubit.dart';
import '../../../logic/movies/movies_state.dart';
import 'movies_list_view.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {
        if (state is MoviesErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<MoviesCubit>().loadPopularMovies();
          },
          child: Builder(
            builder: (context) {
              if (state is MoviesLoadingState) {
                return Skeletonizer(
                  enabled: true,
                  child: MoviesListView(
                    movies: List.generate(
                      10,
                      (_) => AppConstants.fakeMovieModel,
                    ),
                  ),
                );
              } else if (state is MoviesLoadedState) {
                return Column(
                  children: [
                    Expanded(
                      child: MoviesListView(
                        movies: state.moviesResource.data,
                        isLoadingMore: state.isLoadingMore,
                        onLoadMore: () {
                          context.read<MoviesCubit>().loadMoreMovies();
                        },
                      ),
                    ),
                    if (state.error != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.error!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                  ],
                );
              } else if (state is MoviesErrorState) {
                return CustomErrorMessage(message: state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
