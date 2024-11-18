abstract class MovieDetailsEvent {}

class LoadMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  LoadMovieDetailsEvent({required this.movieId});
}
