// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      status: json['code'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      rfid: json['rfid'] as String?,
      saldo: json['saldo'] as String?,
      sekolah: json['sekolah'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'rfid': instance.rfid,
      'saldo': instance.saldo,
      'sekolah': instance.sekolah,
    };
