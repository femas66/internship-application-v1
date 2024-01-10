class AttendanceDetailModel {
  int? id;
  String? status;
  String? time;
  String? date;

  AttendanceDetailModel({this.id, this.status, this.time, this.date});

  factory AttendanceDetailModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailModel(
        id: json['id'],
        status: json['status'],
        time: json['time'],
        date: json['date']);
  }
}
