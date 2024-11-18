import '../../models/movie_model.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieModel movieDetails;

  MovieDetailsLoadedState(this.movieDetails);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;

  MovieDetailsErrorState(this.message);
}
