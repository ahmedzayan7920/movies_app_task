import 'package:dartz/dartz.dart';
import 'package:movies_app_task/core/models/resource_model.dart';

import '../error/failure.dart';

abstract class BaseApiService {
  Future<Either<Failure, ResourceModel<T>>> get<T, M>({
    required String path,
    required M Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
  });
}
