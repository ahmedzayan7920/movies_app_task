import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../models/movie_model.dart';
import '../../repos/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieDetailsState _state = MovieDetailsLoadingState();
  MovieDetailsState get state => _state;

  MovieDetailsProvider({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;


  Future<void> loadMovieDetails({required int movieId}) async {
    _state = MovieDetailsLoadingState();
    notifyListeners();
    final result = await _movieRepository.getMovieDetails(id: movieId);
    result.fold(
      (failure) {
        _state = MovieDetailsErrorState(failure.message);
      },
      (movieDetails) {
        _state = MovieDetailsLoadedState(movieDetails);
      },
    );
    notifyListeners();
  }

  final _fakeMovieDetails = AppConstants.fakeMovieModel;

  MovieModel get fakeMovieDetails => _fakeMovieDetails;
}
