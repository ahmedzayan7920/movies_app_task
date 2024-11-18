import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../repos/movie_repository.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository _movieRepository;

  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MoviesLoadingState()) {
    on<LoadPopularMoviesEvent>(_onLoadPopularMoviesEvent);
    on<LoadMoreMoviesEvent>(_onLoadMoreMoviesEvent);
  }

  Future<void> _onLoadPopularMoviesEvent(
      LoadPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(const MoviesLoadingState());

    final result = await _movieRepository.getPopularMovies();
    result.fold(
      (failure) => emit(MoviesErrorState(failure.message)),
      (moviesResource) => emit(MoviesLoadedState(moviesResource: moviesResource)),
    );
  }

  Future<void> _onLoadMoreMoviesEvent(
      LoadMoreMoviesEvent event, Emitter<MoviesState> emit) async {
    final currentState = state;
    if (currentState is! MoviesLoadedState ||
        currentState.isLoadingMore ||
        !(currentState.moviesResource.hasNextPage)) {
      return;
    }

    emit(currentState.copyWith(isLoadingMore: true));

    final nextPage = currentState.moviesResource.nextPage;
    if (nextPage == null) {
      emit(currentState.copyWith(
        isLoadingMore: false,
        error: AppStrings.fetchNextPageError,
      ));
      return;
    }

    final result = await _movieRepository.getPopularMovies(page: nextPage);

    result.fold(
      (failure) => emit(currentState.copyWith(
        isLoadingMore: false,
        error: failure.message,
      )),
      (moviesResource) => emit(currentState.copyWith(
        moviesResource: currentState.moviesResource.copyWith(
          data: [...currentState.moviesResource.data, ...moviesResource.data],
          pagination: moviesResource.pagination,
        ),
        isLoadingMore: false,
        error: null,
      )),
    );
  }
}
