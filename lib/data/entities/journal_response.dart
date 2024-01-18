import 'package:json_annotation/json_annotation.dart';
import 'package:pkl_apps/data/entities/student_response.dart';
import 'package:pkl_apps/data/journal.dart';

part 'journal_response.g.dart';

@JsonSerializable()
class JournalResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "student")
  final StudentResponse student;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "activity")
  String? activity;
  @JsonKey(name: "image")
  String? image;

  JournalResponse({
    required this.id,
    required this.student,
    this.date,
    this.activity,
    this.image,
  });

  factory JournalResponse.fromJson(Map<String, dynamic> json) =>
      _$JournalResponseFromJson(json);

  Journal toJournal() => Journal(
        id: id,
        student: student.toStudent(),
        date: date,
        activity: activity,
        image: (image == "https://pkl.hummatech.com/storage/image/Kosong.png")
            ? null
            : image,
      );
}
