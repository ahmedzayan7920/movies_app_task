import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repos/movie_repository.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository _movieRepository;

  MovieDetailsBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(MovieDetailsLoadingState()) {
    on<LoadMovieDetailsEvent>(_onLoadMovieDetailsEvent);
  }

  Future<void> _onLoadMovieDetailsEvent(
      LoadMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoadingState());

    final result = await _movieRepository.getMovieDetails(id: event.movieId);
    result.fold(
      (failure) => emit(MovieDetailsErrorState(failure.message)),
      (movieDetailsResource) =>
          emit(MovieDetailsLoadedState(movieDetailsResource.data)),
    );
  }
}
