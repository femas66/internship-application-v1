class StudentModel {
  int? id;
  String? name;
  String? photo;
  String? classroom;
  String? school;

  StudentModel({
    this.id,
    this.name,
    this.photo,
    this.classroom,
    this.school,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      classroom: json['classroom'],
      school: json['school'],
    );
  }
}
