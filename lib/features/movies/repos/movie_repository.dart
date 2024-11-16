import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/models/resource_model.dart';
import '../models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, ResourceModel<List<MovieModel>>>> getPopularMovies({int page = 1});
  Future<Either<Failure, ResourceModel<MovieModel>>> getMovieDetails({
    required int id,
  });
}
