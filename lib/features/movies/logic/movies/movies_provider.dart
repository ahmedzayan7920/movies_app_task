import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import '../../repos/movie_repository.dart';
import 'movies_state.dart';

class MoviesProvider extends ChangeNotifier {
  final MovieRepository _repository;

  MoviesState _state = MoviesLoadingState();
  MoviesState get state => _state;

  MoviesProvider(this._repository);

  Future<void> loadPopularMovies() async {
    _state = MoviesLoadingState();
    notifyListeners();
    final result = await _repository.getPopularMovies();
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
    (index) => MovieModel(
      id: index,
      title: 'Venom: The Last Dance',
      overview: 'Overview of the movie Venom: The Last Dance ...',
      posterImage: '',
      backdropImage: '',
      voteAverage: 7.5,
      voteCount: 1000,
    ),
  );

  List<MovieModel> get fakeMovies => _fakeMovies;
}
