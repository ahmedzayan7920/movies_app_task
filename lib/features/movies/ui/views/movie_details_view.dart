import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app/di.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/custom_error_message.dart';
import '../../logic/movie_details/movie_details_bloc.dart';
import '../../logic/movie_details/movie_details_event.dart';
import '../../logic/movie_details/movie_details_state.dart';
import '../widgets/common/blurred_background_image.dart';
import '../widgets/movie_details/movie_details_item.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(movieRepository: getIt())
        ..add(LoadMovieDetailsEvent(movieId: movieId)),
      child: Scaffold(
        body: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
          listener: (context, state) {
            if (state is MovieDetailsErrorState) {
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
                context
                    .read<MovieDetailsBloc>()
                    .add(LoadMovieDetailsEvent(movieId: movieId));
              },
              child: Builder(
                builder: (context) {
                  if (state is MovieDetailsLoadingState) {
                    return Skeletonizer(
                      enabled: true,
                      child: MovieDetailsItem(
                        movieDetails: AppConstants.fakeMovieModel,
                      ),
                    );
                  } else if (state is MovieDetailsLoadedState) {
                    return MovieDetailsItem(movieDetails: state.movieDetails);
                  } else if (state is MovieDetailsErrorState) {
                    return BlurredBackgroundImage(
                      imageUrl: '',
                      withBackArrow: true,
                      child: CustomErrorMessage(message: state.message),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
