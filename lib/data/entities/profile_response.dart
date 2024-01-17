import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/profile.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "birthday")
  final String birthday;
  @JsonKey(name: "school")
  final String school;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "sp")
  final String sp;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.birthday,
    required this.school,
    required this.phoneNumber,
    required this.sp,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Profile toProfile() => Profile(
        id: id,
        name: name,
        email: email,
        photo: photo,
        birthday: birthday,
        school: school,
        phoneNumber: phoneNumber,
        sp: sp,
      );
}
