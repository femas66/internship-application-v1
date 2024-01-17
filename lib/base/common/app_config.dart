import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConfig {
  static final String baseUrl = dotenv.get("BASE_URL");
}
