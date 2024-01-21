import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:pkl_apps/data/entities/profile_response.dart';
import 'package:pkl_apps/data/meta.dart';
import 'package:pkl_apps/data/profile.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class ProfileService extends SharedApi {
  final box = GetStorage();

  Future<Profile> getProfile() async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}profile");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      if (response.statusCode == 200) box.write('photo', responseJson['photo']);
      return ProfileResponse.fromJson(responseJson).toProfile();
    } on Exception catch (e) {
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }

  Future<Meta> updateProfile(String no, File? photo) async {
    showLoading();
    try {
      Uri uri = Uri.parse("${super.baseUrl}profile?_method=PUT");
      if (photo != null) {
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(super.getToken() as Map<String, String>);

        request.fields['no'] = no;

        var stream = http.ByteStream(photo.openRead());
        var length = await photo.length();

        var multipartFile = http.MultipartFile('photo', stream, length,
            filename: photo.path.split('/').last);
        request.files.add(multipartFile);
        var response = await request.send();
        var responseBody = await response.stream.bytesToString();
        var responseJson = jsonDecode(responseBody);
        stopLoading();
        return Meta(
          status: responseJson['meta']['code'],
          message: responseJson['meta']['message'],
        );
      } else {
        final response = await http.post(uri, headers: super.getToken(), body: {
          "no": no,
        });
        stopLoading();
        return Meta(
            status: jsonDecode(response.body)['meta']['code'],
            message: jsonDecode(response.body)['meta']['message']);
      }
    } on Exception catch (e) {
      stopLoading();
      showErrorMessage("Error : $e");
      throw Exception("ERROR : $e");
    }
  }
}
