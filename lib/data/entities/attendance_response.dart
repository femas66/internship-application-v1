import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/attendance.dart';
import 'package:pkl_apps/data/entities/attendance_detail_response.dart';
import 'package:pkl_apps/data/entities/student_response.dart';

part 'attendance_response.g.dart';

@JsonSerializable()
class AttendanceResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "student")
  final StudentResponse student;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "detail_attendances")
  List<AttendanceDetailResponse>? detailAttendances;

  AttendanceResponse({
    required this.id,
    required this.student,
    required this.status,
    required this.date,
    this.detailAttendances,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);

  Attendance toAttendance() => Attendance(
      id: id,
      student: student.toStudent(),
      status: status,
      date: date,
      attendanceDetail:
          detailAttendances!.map((e) => e.toAttendanceDetail()).toList());
}
