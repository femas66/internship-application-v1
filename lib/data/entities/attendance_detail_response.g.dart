// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceDetailResponse _$AttendanceDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceDetailResponse(
      id: json['id'] as int,
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$AttendanceDetailResponseToJson(
        AttendanceDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'time': instance.time,
      'date': instance.date,
    };
