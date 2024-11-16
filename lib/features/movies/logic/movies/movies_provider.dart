import 'package:flutter/material.dart';
import 'package:movies_app_task/core/utils/app_strings.dart';

import '../../../../core/utils/app_constants.dart';
import '../../models/movie_model.dart';
import '../../repos/movie_repository.dart';
import 'movies_state.dart';

class MoviesProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MoviesState _state = const MoviesLoadingState();
  MoviesState get state => _state;

  MoviesProvider({required MovieRepository movieRepository})
      : _movieRepository = movieRepository {
    loadPopularMovies();
  }

  Future<void> loadPopularMovies() async {
    _state = const MoviesLoadingState();
    notifyListeners();

    final result = await _movieRepository.getPopularMovies();
    result.fold(
      (failure) {
        _state = MoviesErrorState(failure.message);
      },
      (moviesResource) {
        _state = MoviesLoadedState(moviesResource: moviesResource);
      },
    );
    notifyListeners();
  }

  Future<void> loadMoreMovies() async {
    final currentState = _state;
    if (currentState is! MoviesLoadedState ||
        currentState.isLoadingMore ||
        !(currentState.moviesResource.hasNextPage)) {
      return;
    }
    final nextPage = (currentState.moviesResource.nextPage);
    if (nextPage == null) {
      _state = currentState.copyWith(
        error: AppStrings.fetchNextPageError,
      );

      notifyListeners();
      return;
    } else {
      _state = currentState.copyWith(isLoadingMore: true);

      notifyListeners();
    }

    final result = await _movieRepository.getPopularMovies(page: nextPage);

    result.fold(
      (failure) {
        _state = currentState.copyWith(
          isLoadingMore: false,
          error: failure.message,
        );
      },
      (moviesResource) {
        _state = currentState.copyWith(
          moviesResource: currentState.moviesResource.copyWith(
            data: [...currentState.moviesResource.data, ...moviesResource.data],
            pagination: moviesResource.pagination,
          ),
          isLoadingMore: false,
          error: null,
        );
      },
    );
    notifyListeners();
  }

  final _fakeMovies = List.generate(
    10,
    (index) => AppConstants.fakeMovieModel,
  );

  List<MovieModel> get fakeMovies => _fakeMovies;
}
