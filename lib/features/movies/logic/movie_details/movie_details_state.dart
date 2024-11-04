import '../../models/movie_details_model.dart';

sealed class MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetailsModel movieDetails;
  MovieDetailsLoadedState(this.movieDetails);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;
  MovieDetailsErrorState(this.message);
}
