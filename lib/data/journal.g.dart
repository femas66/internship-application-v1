// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalImpl _$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$JournalImpl(
      id: json['id'] as int?,
      student: Student.fromJson(json['student'] as Map<String, dynamic>),
      date: json['date'] as String?,
      activity: json['activity'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$JournalImplToJson(_$JournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'date': instance.date,
      'activity': instance.activity,
      'image': instance.image,
    };
