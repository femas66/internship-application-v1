import 'dart:convert';
import 'package:pkl_apps/data/entities/profile_response.dart';
import 'package:pkl_apps/data/profile.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class ProfileService extends SharedApi {
  Future<Profile> getProfile() async {
    showLoading();
    try {
      Uri uri = Uri.parse("${super.baseUrl}profile");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      stopLoading();
      return ProfileResponse.fromJson(responseJson).toProfile();
    } on Exception catch (e) {
      stopLoading();
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }
}
