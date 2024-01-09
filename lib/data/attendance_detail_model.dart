class AttendanceDetailModel {
  int? id;
  String? status;
  String? time;

  AttendanceDetailModel({this.id, this.status, this.time});

  factory AttendanceDetailModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailModel(
        id: json['id'], status: json['status'], time: json['time']);
  }
}
