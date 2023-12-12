class UserModel {
  int? status;
  int? id;
  String? name;
  String? email;
  String? rfid;
  String? saldo;
  String? sekolah;

  UserModel({
    this.status,
    this.id,
    this.name,
    this.email,
    this.rfid,
    this.saldo,
    this.sekolah,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        status: json['code'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        rfid: json['rfid'].toString(),
        saldo: json['saldo'].toString(),
        sekolah: json['sekolah']);
  }
}
