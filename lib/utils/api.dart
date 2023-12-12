import 'package:get_storage/get_storage.dart';

class SharedApi {
  final String baseUrl = "https://pkl.hummatech.com/api/";
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
