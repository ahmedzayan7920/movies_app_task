import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseApiService {
  Future<Either<Failure, T>> get<T, M>({
    required String path,
    required M Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
    String? dataKey,
  });
}
