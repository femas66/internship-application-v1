import 'dart:convert';
import 'dart:io';

import 'package:pkl_apps/data/journal_model.dart';
import 'package:pkl_apps/data/meta.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class JournalService extends SharedApi {
  Future<List> getJournal({String limit = "100"}) async {
    Uri uri = Uri.parse("${super.baseUrl}journal?limit=$limit");
    final response = await http.get(uri, headers: super.getToken());
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      List result = responseData.map((e) => JournalModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception("Gagal fetch");
    }
  }

  Future<Meta> postJournal(String kegiatan, File bukti) async {
    showLoading();
    try {
      Uri uri = Uri.parse("${super.baseUrl}journal");

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(super.getToken() as Map<String, String>);

      request.fields['kegiatan'] = kegiatan;

      var stream = http.ByteStream(bukti.openRead());
      var length = await bukti.length();

      var multipartFile = http.MultipartFile('image', stream, length,
          filename: bukti.path.split('/').last);
      request.files.add(multipartFile);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var responseJson = jsonDecode(responseBody);
      stopLoading();
      return Meta(
          status: responseJson['code'] ?? responseJson['meta']['code'] ?? 400,
          message: responseJson['message'] ?? responseJson['meta']['message']);
    } on Exception catch (e) {
      stopLoading();
      showErrorMessage("Error : $e");
      throw Exception("ERROR : $e");
    }
  }
}
