import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/models/resource_model.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/dio_client.dart';
import '../models/movie_model.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final DioClient _dioClient;

  MovieRepositoryImpl(this._dioClient);

  @override
  Future<Either<Failure, ResourceModel<List<MovieModel>>>> getPopularMovies(
      {int page = 1}) {
    return _dioClient.get<List<MovieModel>, MovieModel>(
      path: ApiEndpoints.popularMovies,
      fromJson: MovieModel.fromJson,
      queryParameters: {
        'page': page,
      },
    );
  }

  @override
  Future<Either<Failure, ResourceModel<MovieModel>>> getMovieDetails({
    required int id,
  }) {
    return _dioClient.get<MovieModel, MovieModel>(
      path: ApiEndpoints.movieDetails(id: id),
      fromJson: MovieModel.fromJson,
    );
  }
}
