import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/dio_client.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final DioClient _dioClient;

  MovieRepositoryImpl(this._dioClient);

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() {
    return _dioClient.get<List<MovieModel>, MovieModel>(
      path: ApiEndpoints.popularMovies,
      fromJson: MovieModel.fromJson,
      dataKey: 'results',
    );
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      {required int id}) {
    return _dioClient.get<MovieDetailsModel, MovieDetailsModel>(
      path: ApiEndpoints.movieDetails(id: id),
      fromJson: MovieDetailsModel.fromJson,
    );
  }
}
