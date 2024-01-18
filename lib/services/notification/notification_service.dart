import 'dart:convert';
import 'package:pkl_apps/data/entities/notification_response.dart';
import 'package:pkl_apps/data/notification.dart';
import 'package:pkl_apps/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class NotificationService extends SharedApi {
  Future<List> getNotification() async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}notifications");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      return responseJson
          .map((e) => NotificationResponse.fromJson(e).toNotification())
          .toList();
    } on Exception catch (e) {
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }

  Future<Notification> detailNotification(String id) async {
    try {
      Uri uri = Uri.parse("${super.baseUrl}notification/$id");
      final response = await http.get(uri, headers: super.getToken());
      final responseJson = jsonDecode(response.body)['data'];
      print("RESPONSE $responseJson");
      print("ID $id");
      return NotificationResponse.fromJson(responseJson).toNotification();
    } on Exception catch (e) {
      showErrorMessage("ERROR : $e");
      throw Exception("Error : $e");
    }
  }
}
