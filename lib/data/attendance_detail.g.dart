// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceDetailImpl _$$AttendanceDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDetailImpl(
      id: json['id'] as int,
      status: json['status'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$AttendanceDetailImplToJson(
        _$AttendanceDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'time': instance.time,
      'date': instance.date,
    };
