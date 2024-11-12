import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, MovieModel>> getMovieDetails({required int id});
}