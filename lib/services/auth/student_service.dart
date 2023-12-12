import 'dart:convert';

import 'package:pkl_apps/data/student_model.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;

class StudentService extends SharedApi {
  Future<List> getAllStudents() async {
    Uri uri = Uri.parse("${super.baseUrl}list-students");
    final response = await http.get(uri, headers: super.getToken());
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      List result = responseData.map((e) => StudentModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception("Gagal fetch");
    }
  }
}
