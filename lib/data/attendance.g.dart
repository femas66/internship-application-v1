// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: json['id'] as int,
      student: Student.fromJson(json['student'] as Map<String, dynamic>),
      status: json['status'] as String,
      date: json['date'] as String,
      attendanceDetail: (json['attendanceDetail'] as List<dynamic>?)
          ?.map((e) => AttendanceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'status': instance.status,
      'date': instance.date,
      'attendanceDetail': instance.attendanceDetail,
    };
