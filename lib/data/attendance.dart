import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkl_apps/data/attendance_detail.dart';
import 'package:pkl_apps/data/student.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required int id,
    required Student student,
    required String status,
    required String date,
    List<AttendanceDetail>? attendanceDetail,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);
}
