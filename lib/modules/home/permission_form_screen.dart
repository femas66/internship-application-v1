import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
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
  String? fileSizeMb;
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Halaman Izin",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Dari",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (dari == null)
                    ? "----/--/--"
                    : '${dari!.toLocal()}'.split(' ')[0],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 14),
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: primaryBlue,
                  ),
                  child: Center(
                    child: Text(
                      "Pilih tanggal",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                          fontSize: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Sampai",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (sampai == null)
                    ? "----/--/--"
                    : '${sampai!.toLocal()}'.split(' ')[0],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 14),
              ),
              InkWell(
                onTap: () => _selectSampai(context),
                child: Container(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: primaryBlue,
                  ),
                  child: Center(
                    child: Text(
                      "Pilih tanggal",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                          fontSize: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 24),
          Text(
            "Deskripsikan alasannya",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: deskripsiController,
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                  hintText: "Masukkan deskripsi...",
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Keterangan",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
              ),
              ListTile(
                title: Text(
                  'Sakit',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
                leading: Radio(
                  value: list.last,
                  groupValue: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Izin',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackColor),
                ),
                leading: Radio(
                  value: list.first,
                  groupValue: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Bukti",
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: selectedFile == null,
            child: InkWell(
              onTap: () => _pickFiles(),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child: Text(
                    "Unggah bukti",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: selectedFile != null,
            child: InkWell(
              onTap: () => _pickFiles(),
              child: Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (selectedFile != null)
                            ? selectedFile!.path.split('/').last
                            : "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      IconButton(
                          onPressed: () => setState(() {
                                selectedFile = null;
                              }),
                          icon: Icon(
                            Icons.delete,
                            color: whiteColor,
                          ))
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              if (dari != null && sampai != null && selectedFile != null) {
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
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else {
                    showErrorMessage(value.message as String);
                  }
                });
              } else {
                showErrorMessage("Lengkapi formnya");
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: primaryBlue, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "Kirim",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
