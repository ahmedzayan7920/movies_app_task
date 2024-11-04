import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../app/app_env.dart';

import '../error/failure.dart';
import 'api_interceptor.dart';
import 'base_api_service.dart';
import 'dio_error_handler.dart';

class DioClient implements BaseApiService {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEnv.baseUrl ?? "",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    )..interceptors.add(ApiInterceptor());
  }

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
        options: Options(extra: {'dataKey': dataKey}),
      );

      final data = _parseResponse<T, M>(response.data, fromJson);
      return Right(data);
    } on DioException catch (e) {
      return Left(handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error: ${e.toString()}'));
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
        throw FormatException('Expected a List but got ${data.runtimeType}');
      }
    } else if (data is Map<String, dynamic>) {
      return fromJson(data) as T;
    } else {
      throw FormatException('Expected Map but got ${data.runtimeType}');
    }
  }
}
