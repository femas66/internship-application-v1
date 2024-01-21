// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatementLetterImpl _$$StatementLetterImplFromJson(
        Map<String, dynamic> json) =>
    _$StatementLetterImpl(
      id: json['id'] as int,
      description: json['description'] as String,
      sp: json['sp'] as String,
      date: json['date'] as String,
      letterHead: json['letterHead'] as String,
      proof: json['proof'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$StatementLetterImplToJson(
        _$StatementLetterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'sp': instance.sp,
      'date': instance.date,
      'letterHead': instance.letterHead,
      'proof': instance.proof,
      'createdAt': instance.createdAt,
    };
