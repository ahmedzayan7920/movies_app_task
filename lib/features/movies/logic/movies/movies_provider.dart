import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../models/movie_model.dart';
import '../../repos/movie_repository.dart';
import 'movies_state.dart';

class MoviesProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MoviesState _state = MoviesLoadingState();
  MoviesState get state => _state;

  MoviesProvider({required MovieRepository movieRepository})
      : _movieRepository = movieRepository {
    loadPopularMovies();
  }

  Future<void> loadPopularMovies() async {
    _state = MoviesLoadingState();
    notifyListeners();
    final result = await _movieRepository.getPopularMovies();
    result.fold(
      (failure) {
        _state = MoviesErrorState(failure.message);
      },
      (movies) {
        _state = MoviesLoadedState(movies);
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
