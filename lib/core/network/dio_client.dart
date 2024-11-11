import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../utils/app_strings.dart';

import '../error/failure.dart';
import 'api_keys.dart';
import 'base_api_service.dart';
import 'dio_error_handler.dart';

class DioClient implements BaseApiService {
  final Dio _dio;

  DioClient(this._dio);

  @override
  Future<Either<Failure, T>> get<T, M>({
    required String path,
    required M Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
    String? dataKey,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(extra: {ApiKeys.responseDataKey: dataKey}),
      );
      final data = _parseResponse<T, M>(response.data, fromJson);
      return Right(data);
    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(
          ServerFailure(message: AppStrings.unexpectedError + e.toString()));
    }
  }

  T _parseResponse<T, M>(
    dynamic data,
    M Function(Map<String, dynamic>) fromJson,
  ) {
    if (T == List<M>) {
      if (data is List) {
        return data
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList() as T;
      } else {
        throw FormatException(
            AppStrings.expectedListError + data.runtimeType.toString());
      }
    } else if (data is Map<String, dynamic>) {
      return fromJson(data) as T;
    } else {
      throw FormatException(AppStrings.expectedMapError + data.runtimeType.toString());
    }
  }
}
