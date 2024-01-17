// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentResponse _$StudentResponseFromJson(Map<String, dynamic> json) =>
    StudentResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      classroom: json['classroom'] as String,
      school: json['school'] as String,
    );

Map<String, dynamic> _$StudentResponseToJson(StudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'classroom': instance.classroom,
      'school': instance.school,
    };
