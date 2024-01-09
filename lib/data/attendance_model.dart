import 'package:pkl_apps/data/attendance_detail_model.dart';
import 'package:pkl_apps/data/student_model.dart';

class AttendanceModel {
  int? id;
  StudentModel? student;
  String? status;
  String? date;
  List<AttendanceDetailModel>? attendanceDetail;

  AttendanceModel({
    this.id,
    this.student,
    this.status,
    this.date,
    this.attendanceDetail,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    var comments = json['comment'] as List;
    List<AttendanceDetailModel> attendanceDetails = comments
        .map((atndnc) => AttendanceDetailModel.fromJson(atndnc))
        .toList();
    return AttendanceModel(
        id: json['id'],
        student: StudentModel.fromJson(json['student']),
        status: json['status'],
        date: json['date'],
        attendanceDetail: attendanceDetails);
  }
}
