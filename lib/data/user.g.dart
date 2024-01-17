// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      status: json['status'] as int?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      rfid: json['rfid'] as String?,
      saldo: json['saldo'] as String?,
      sekolah: json['sekolah'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'rfid': instance.rfid,
      'saldo': instance.saldo,
      'sekolah': instance.sekolah,
    };
