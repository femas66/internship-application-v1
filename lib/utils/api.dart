import 'package:get_storage/get_storage.dart';
import 'package:pkl_apps/base/common/app_config.dart';

class SharedApi {
  final String baseUrl = AppConfig.baseUrl;
  Map<String, String>? getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null) {
      return {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      };
    } else {
      return {
        "Accept": "application/json",
      };
    }
  }
}
