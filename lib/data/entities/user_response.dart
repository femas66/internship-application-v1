import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkl_apps/data/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "code")
  int? status;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "rfid")
  String? rfid;
  @JsonKey(name: "saldo")
  String? saldo;
  @JsonKey(name: "sekolah")
  String? sekolah;

  UserResponse({
    this.status,
    this.id,
    this.name,
    this.email,
    this.rfid,
    this.saldo,
    this.sekolah,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  User toUser() => User(
        status: status,
        id: id,
        name: name,
        email: email,
        rfid: rfid,
        saldo: saldo,
        sekolah: sekolah,
      );
}
