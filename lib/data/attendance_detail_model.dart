class AttendanceDetailModel {
  int? id;
  String? name;
  String? time;

  AttendanceDetailModel({this.id, this.name, this.time});

  factory AttendanceDetailModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDetailModel(
        id: json['id'], name: json['name'], time: json['time']);
  }
}
