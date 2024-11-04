import 'api_response.dart';

abstract class BaseApiService {
  Future<ApiResponse<T>> getRequest<T>(String path, {Map<String, dynamic>? queryParameters});
}
