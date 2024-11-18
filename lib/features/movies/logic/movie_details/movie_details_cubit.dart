import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository _movieRepository;

  MovieDetailsCubit({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(MovieDetailsLoadingState());

  Future<void> loadMovieDetails({required int movieId}) async {
    emit(MovieDetailsLoadingState());

    final result = await _movieRepository.getMovieDetails(id: movieId);
    result.fold(
      (failure) => emit(MovieDetailsErrorState(failure.message)),
      (movieDetailsResource) =>
          emit(MovieDetailsLoadedState(movieDetailsResource.data)),
    );
  }
}
