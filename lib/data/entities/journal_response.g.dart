// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalResponse _$JournalResponseFromJson(Map<String, dynamic> json) =>
    JournalResponse(
      id: json['id'] as int,
      student:
          StudentResponse.fromJson(json['student'] as Map<String, dynamic>),
      date: json['date'] as String?,
      activity: json['activity'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$JournalResponseToJson(JournalResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'date': instance.date,
      'activity': instance.activity,
      'image': instance.image,
    };
