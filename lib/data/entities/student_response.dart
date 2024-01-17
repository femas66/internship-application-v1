import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/student.dart';

part 'student_response.g.dart';

@JsonSerializable()
class StudentResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "classroom")
  final String classroom;
  @JsonKey(name: "school")
  final String school;

  StudentResponse({
    required this.id,
    required this.name,
    required this.photo,
    required this.classroom,
    required this.school,
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentResponseFromJson(json);

  Student toStudent() => Student(
      id: id, name: name, photo: photo, classroom: classroom, school: school);
}
