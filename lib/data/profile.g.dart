// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
      birthday: json['birthday'] as String,
      school: json['school'] as String,
      phoneNumber: json['phoneNumber'] as String,
      sp: json['sp'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'birthday': instance.birthday,
      'school': instance.school,
      'phoneNumber': instance.phoneNumber,
      'sp': instance.sp,
    };
