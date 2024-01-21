// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_letter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementLetterResponse _$StatementLetterResponseFromJson(
        Map<String, dynamic> json) =>
    StatementLetterResponse(
      id: json['id'] as int,
      description: json['description'] as String,
      sp: json['sp'] as String,
      date: json['date'] as String,
      letterHead: json['letter_head'] as String,
      proof: json['proof'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$StatementLetterResponseToJson(
        StatementLetterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'sp': instance.sp,
      'date': instance.date,
      'letter_head': instance.letterHead,
      'proof': instance.proof,
      'created_at': instance.createdAt,
    };
