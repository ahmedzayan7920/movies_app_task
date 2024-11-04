import 'package:flutter/material.dart';

import '../../models/movie_details_model.dart';
import '../../repos/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final MovieRepository _repository;

  MovieDetailsState _state = MovieDetailsLoadingState();
  MovieDetailsState get state => _state;

  MovieDetailsProvider(this._repository);

  Future<void> loadMovieDetails({required int movieId}) async {
    _state = MovieDetailsLoadingState();
    notifyListeners();
    final result = await _repository.getMovieDetails(id: movieId);
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

  final _fakeMovieDetails = MovieDetailsModel(
    id: 0,
    title: 'Venom: The Last Dance',
    overview: 'Overview of the movie Venom: The Last Dance ...',
    posterImage: '',
    releaseDate: '2021-09-01',
    voteAverage: 7.5,
    voteCount: 1000,
    genres: [
      Genre(id: 0, name: 'Action'),
      Genre(id: 1, name: 'Adventure'),
    ],
    productionCompanies: [
      ProductionCompany(
        id: 0,
        name: 'Marvel Studios',
        logoPath: '',
        originCountry: 'US',
      ),
      ProductionCompany(
        id: 1,
        name: 'Sony Pictures',
        logoPath: '',
        originCountry: 'US',
      ),
    ],
    productionCountries: [
      ProductionCountry(
        iso31661: 'US',
        name: 'United States of America',
      ),
      ProductionCountry(
        iso31661: 'CA',
        name: 'Canada',
      ),
    ],
    spokenLanguages: [
      SpokenLanguage(
        iso6391: 'en',
        name: 'English',
      ),
      SpokenLanguage(
        iso6391: 'fr',
        name: 'Français',
      ),
    ],
  );

  MovieDetailsModel get fakeMovieDetails => _fakeMovieDetails;
}
