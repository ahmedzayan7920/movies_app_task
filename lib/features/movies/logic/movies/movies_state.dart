import '../../models/movie_model.dart';

sealed class MoviesState {}


class MoviesLoadingState extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final List<MovieModel> movies;
  MoviesLoadedState(this.movies);
}

class MoviesErrorState extends MoviesState {
  final String message;
  MoviesErrorState(this.message);
}
