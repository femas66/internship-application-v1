import 'package:pkl_apps/data/student_model.dart';

class AttendanceModel {
  int? id;
  StudentModel? student;
  String? information;
  String? description;
  String? proof;
  String? date;
  String? status;

  AttendanceModel({
    this.id,
    this.student,
    this.information,
    this.description,
    this.proof,
    this.date,
    this.status,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'],
      student: StudentModel.fromJson(json['student']),
      information: json['information'],
      description: json['description'],
      proof: json['proof'],
      date: json['date'],
      status: json['status'],
    );
  }
}
