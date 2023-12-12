import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class PermissionFormScreen extends StatefulWidget {
  static const String routeName = '/permission-form-screen';

  @override
  State<PermissionFormScreen> createState() => _PermissionFormScreenState();
}

class _PermissionFormScreenState extends State<PermissionFormScreen> {
  late AttendanceService attendanceService;
  DateTime? dari;
  DateTime? sampai;
  TextEditingController deskripsiController = TextEditingController();
  File? selectedFile;
  List<String> list = <String>['izin', 'sakit'];
  String dropdownValue = "izin";

  @override
  void initState() {
    super.initState();
    attendanceService = AttendanceService();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != dari) {
      setState(() {
        dari = picked;
      });
    }
  }

  Future<void> _selectSampai(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != sampai) {
      setState(() {
        sampai = picked;
      });
    }
  }

  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Izin'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            (dari == null) ? "Dari" : '${dari!.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Pilih Tanggal Mulai'),
          ),
          SizedBox(height: 20),
          Text(
            (sampai == null) ? "Sampai" : '${sampai!.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectSampai(context),
            child: Text('Pilih Tanggal Sampai'),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: deskripsiController,
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                  hintText: "Masukkan deskripsi izin",
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickFiles(),
            child: Text("Pilih Berkas"),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (dari != null || sampai != null || selectedFile != null) {
                showLoading();
                attendanceService
                    .postPermission(
                      '${dari!.toLocal()}'.split(' ')[0],
                      '${sampai!.toLocal()}'.split(' ')[0],
                      dropdownValue,
                      deskripsiController.text,
                      selectedFile as File,
                    )
                    .then((value) {
                  stopLoading();
                  if (value.status == 200) {
                    showSuccessMessage("Berhasil membuat permintaan izin");
                    Navigator.pop(context);
                  } else {
                    showErrorMessage(value.message as String);
                  }
                });
              }
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 20),
          if (selectedFile != null)
            Container(
              width: double.infinity,
              child: Image.file(selectedFile as File),
            ),
        ],
      ),
    );
  }
}