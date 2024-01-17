import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_detail.freezed.dart';
part 'attendance_detail.g.dart';

@freezed
class AttendanceDetail with _$AttendanceDetail {
  const factory AttendanceDetail({
    required int id,
    required String status,
    required String time,
    required String date,
  }) = _AttendanceDetail;

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) => _$AttendanceDetailFromJson(json);
}
