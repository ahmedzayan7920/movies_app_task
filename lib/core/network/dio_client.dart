import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app_task/core/network/api_keys.dart';

import '../error/failure.dart';
import '../models/pagination_model.dart';
import '../models/resource_model.dart';
import '../utils/app_strings.dart';
import 'base_api_service.dart';
import 'dio_error_handler.dart';

class DioClient extends BaseApiService {
  final Dio _dio;

  DioClient(this._dio);

  @override
  Future<Either<Failure, ResourceModel<T>>> get<T, M>({
    required String path,
    required M Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = _parseData<T, M>(responseData[ApiKeys.dataKey], fromJson);
      final pagination = responseData[ApiKeys.paginationKey] != null
          ? PaginationModel.fromJson(responseData[ApiKeys.paginationKey])
          : null;

      return Right(ResourceModel<T>(
        data: data,
        pagination: pagination,
      ));
    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(
          ServerFailure(message: AppStrings.unexpectedError + e.toString()));
    }
  }

  T _parseData<T, M>(
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
      throw FormatException(
          AppStrings.expectedMapError + data.runtimeType.toString());
    }
  }
}
