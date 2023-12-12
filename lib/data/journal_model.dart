import 'package:pkl_apps/data/student_model.dart';

class JournalModel {
  int? id;
  StudentModel? student;
  String? date;
  String? activity;
  String? image;

  JournalModel({this.id, this.student, this.date, this.activity, this.image});

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'],
      student: StudentModel.fromJson(json['student']),
      date: json['date'],
      activity: json['activity'],
      image: json['image'],
    );
  }
}
