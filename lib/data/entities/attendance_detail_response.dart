import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/attendance_detail.dart';

part 'attendance_detail_response.g.dart';

@JsonSerializable()
class AttendanceDetailResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "time")
  final String time;
  @JsonKey(name: "date")
  final String date;

  AttendanceDetailResponse({
    required this.id,
    required this.status,
    required this.time,
    required this.date,
  });

  factory AttendanceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailResponseFromJson(json);

  AttendanceDetail toAttendanceDetail() => AttendanceDetail(
        id: id,
        status: status,
        time: time,
        date: date,
      );
}
