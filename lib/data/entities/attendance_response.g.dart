// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      id: json['id'] as int,
      student:
          StudentResponse.fromJson(json['student'] as Map<String, dynamic>),
      status: json['status'] as String,
      date: json['date'] as String,
      detailAttendances: (json['detail_attendances'] as List<dynamic>?)
          ?.map((e) =>
              AttendanceDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'status': instance.status,
      'date': instance.date,
      'detail_attendances': instance.detailAttendances,
    };
