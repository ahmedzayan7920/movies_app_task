import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../utils/app_keys.dart';

abstract class AppEnv {
  static final String? baseUrl = dotenv.env[AppKeys.baseUrl];
  static final String? apiKey = dotenv.env[AppKeys.apiKey];
}
