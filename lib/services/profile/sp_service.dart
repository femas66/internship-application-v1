import 'dart:convert';
import 'package:pkl_apps/data/entities/statement_letter_response.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class SpService extends SharedApi {
  Future<List> getSp() async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}list-sp");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      return responseJson.map((e) => StatementLetterResponse.fromJson(e).toStatementLetter()).toList();
    } on Exception catch (e) {
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }
}
