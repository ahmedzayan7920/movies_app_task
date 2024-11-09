import 'package:flutter/material.dart';

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
    (index) => MovieModel(
      id: index,
      title: 'Venom: The Last Dance',
      overview: 'Overview of the movie Venom: The Last Dance ...',
      posterImage: '',
      backdropImage: '',
      voteAverage: 7.5,
      voteCount: 1000,
      adult: false,
      genreIds: [28, 12, 878],
      originalLanguage: 'en',
      originalTitle: 'Venom: The Last Dance',
      popularity: 100.0,
      releaseDate: '2021-10-01',
      video: false,
    ),
  );

  List<MovieModel> get fakeMovies => _fakeMovies;
}
