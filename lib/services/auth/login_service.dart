import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:pkl_apps/data/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/utils/api.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class LoginService extends SharedApi {
  final box = GetStorage();
  Future<UserModel> doLogin(String email, String password) async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}login");
      http.Response response = await http.post(uri,
          body: {
            "email": email,
            "password": password,
          },
          headers: super.getToken());
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        responseJson['data']['user']['code'] = 200;
        box.write('token', responseJson['data']['token']);
        box.write('isLogin', true);
        box.write('id', responseJson['data']['user']['id']);
        box.write('name', responseJson['data']['user']['name']);
        box.write('email', responseJson['data']['user']['email']);
        box.write('school', responseJson['data']['user']['sekolah']);
        box.write('photo', responseJson['data']['user']['student']['photo']);
        return UserModel.fromJson(responseJson['data']['user']);
      } else {
        return UserModel(status: jsonDecode(response.body)['meta']['code']);
      }
    } on Exception catch (e) {
      showErrorMessage(e.toString());
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    Uri uri = Uri.parse("${super.baseUrl}logout");
    await http.post(uri, headers: super.getToken());
    box.remove('token');
    box.remove('isLogin');
    box.remove('name');
    box.remove('email');
    box.remove('school');
    box.remove('photo');
  }
}
