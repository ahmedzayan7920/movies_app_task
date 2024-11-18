import '../../../../core/models/resource_model.dart';
import '../../models/movie_model.dart';

abstract class MoviesState {
  const MoviesState();
}

class MoviesLoadingState extends MoviesState {
  const MoviesLoadingState();
}

class MoviesLoadedState extends MoviesState {
  final ResourceModel<List<MovieModel>> moviesResource;
  final bool isLoadingMore;
  final String? error;

  const MoviesLoadedState({
    required this.moviesResource,
    this.isLoadingMore = false,
    this.error,
  });

  MoviesLoadedState copyWith({
    ResourceModel<List<MovieModel>>? moviesResource,
    bool? isLoadingMore,
    String? error,
  }) {
    return MoviesLoadedState(
      moviesResource: moviesResource ?? this.moviesResource,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
    );
  }
}

class MoviesErrorState extends MoviesState {
  final String message;
  const MoviesErrorState(this.message);
}
