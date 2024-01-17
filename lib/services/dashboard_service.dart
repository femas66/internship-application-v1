import 'dart:convert';
import 'package:pkl_apps/data/dashboard_statistic.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class DashboardService extends SharedApi {
  Future<DashboardStatistic> getDashboardStatistic() async {
    showLoading();
    try {
      Uri uri = Uri.parse("${super.baseUrl}statistic");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      stopLoading();
      return DashboardStatistic.fromJson(responseJson);
    } on Exception catch (e) {
      stopLoading();
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }
}
