import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'api_keys.dart';
import 'package:path_provider/path_provider.dart';

abstract class DioCacheConfig {
  static Future<CacheOptions> getDefaultCacheOptions() async {
    var cacheDir = await getTemporaryDirectory();
    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: ApiKeys.moviesCacheBoxKey,
    );

    return CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(minutes: 1),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) => request.uri.toString(),
      allowPostMethod: false,
    );
  }
}
