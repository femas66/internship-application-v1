import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/modules/notification/list_notification_screen.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class PermissionFormScreen extends StatefulWidget {
  static const String routeName = '/permission-form-screen';

  const PermissionFormScreen({super.key});

  @override
  State<PermissionFormScreen> createState() => _PermissionFormScreenState();
}

class _PermissionFormScreenState extends State<PermissionFormScreen> {
  late AttendanceService attendanceService;

  late LoginService login;

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
    login = LoginService();
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

  final box = GetStorage();

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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: const BackButton(color: Colors.white),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(
                  context, ListNotificationScreen.routeName),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: PopUpMenuProfile(
                menuList: [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, ProfileScreen.routeName),
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Color(0xFF32344D),
                        ),
                        title: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF32344D),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        showLoading();
                        login.logout().then((value) {
                          stopLoading();
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        });
                      },
                      child: ListTile(
                        leading: const Icon(
                          Icons.output_rounded,
                          color: Color(0xFFE82135),
                        ),
                        title: Text(
                          "Logout",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFE82135),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(box.read('photo')),
                ),
              ),
            ),
          ],
          backgroundColor: const Color(0xFF389BD6),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      box.read('name'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      box.read('school'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFF9A9A9A), width: 1)),
            child: Center(
              child: Text(
                "Tambah Izin",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Dari",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32344D)),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (dari == null)
                    ? "yyyy-mm-dd"
                    : '${dari!.toLocal()}'.split(' ')[0],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 14),
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 14, top: 8, right: 14, bottom: 8),
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
                          fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
          ),
          const Divider(
            color: Color(0xFF389BD6),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Sampai",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32344D)),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (sampai == null)
                    ? "yyyy-mm-dd"
                    : '${sampai!.toLocal()}'.split(' ')[0],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 14),
              ),
              InkWell(
                onTap: () => _selectSampai(context),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 14, top: 8, right: 14, bottom: 8),
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
                          fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Divider(
            color: Color(0xFF389BD6),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Deskripsi",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32344D)),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: deskripsiController,
            decoration: const InputDecoration(hintText: "Deskripsi"),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Keterangan",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF32344D)),
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
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32344D)),
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: selectedFile == null,
            child: InkWell(
              onTap: () => _pickFiles(),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF068DDC), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFF068DDC),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                      child: const Center(
                          child: Icon(
                        Icons.image,
                        color: Color(0xFFFFFFFF),
                      )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Tambah bukti",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4D4D4D)),
                    )
                  ],
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
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  decoration: const BoxDecoration(
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
                          icon: const Icon(
                            Icons.delete,
                            color: whiteColor,
                          ))
                    ],
                  )),
            ),
          ),
          const SizedBox(
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
                  color: const Color(0xFF389BD6),
                  borderRadius: BorderRadius.circular(6)),
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

class PopUpMenuProfile extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMenuProfile({super.key, required this.menuList, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
