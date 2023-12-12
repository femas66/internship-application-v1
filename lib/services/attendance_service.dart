import 'dart:convert';
import 'dart:io';

import 'package:pkl_apps/data/attendance_model.dart';
import 'package:pkl_apps/data/meta_model.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class AttendanceService extends SharedApi {
  Future<List> getAttendance() async {
    Uri uri = Uri.parse("${super.baseUrl}attendance");
    final response = await http.get(uri, headers: super.getToken());
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body)['data'];
      List result =
          responseJson.map((e) => AttendanceModel.fromJson(e)).toList();

      return result;
    } else {
      throw Exception("Gagal fetch absen");
    }
  }

  Future<MetaModel> postAttendance() async {
    Uri uri = Uri.parse("${super.baseUrl}attendance");
    final response = await http.post(uri, headers: super.getToken());
    final responseJson = jsonDecode(response.body);
    return MetaModel(
        status: responseJson['meta']['code'],
        message: responseJson['meta']['message']);
  }

  Future<MetaModel> postPermission(String dari, String sampai,
      String keterangan, String deskripsi, File bukti) async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}permission");

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(super.getToken() as Map<String, String>);

      request.fields['dari'] = dari;
      request.fields['sampai'] = sampai;
      request.fields['keterangan'] = keterangan;
      request.fields['deskripsi'] = deskripsi;

      var stream = http.ByteStream(bukti.openRead());
      var length = await bukti.length();

      var multipartFile = http.MultipartFile('bukti', stream, length,
          filename: bukti.path.split('/').last);
      request.files.add(multipartFile);
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var responseJson = jsonDecode(responseBody)['meta'];
      return MetaModel(
          status: responseJson['code'], message: responseJson['message']);
    } on Exception catch (_) {
      showErrorMessage("Periksa koneksi internet anda!");
      throw Exception("Periksa koneksi internet anda!");
    }
  }
}