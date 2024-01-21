import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/base/router/navigation.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/modules/notification/list_notification_screen.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/services/journal_service.dart';
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class UploadJournalScreen extends StatefulWidget {
  static const String routeName = '/upload-journal-screen';
  const UploadJournalScreen({super.key});

  @override
  State<UploadJournalScreen> createState() => _UploadJournalScreenState();
}

class _UploadJournalScreenState extends State<UploadJournalScreen> {
  late JournalService journal;
  final box = GetStorage();
  late LoginService login;

  @override
  void initState() {
    super.initState();
    journal = JournalService();
    login = LoginService();
  }

  TextEditingController kegiatanController = TextEditingController();
  File? selectedFile;

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
      backgroundColor: const Color(0xFFFFFFFF),
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
        padding: const EdgeInsets.only(right: 12, left: 12),
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
                "Tambah Jurnal",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kegiatan",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF32344D)),
                ),
                Text(
                  "Jumlah Karakter : ${kegiatanController.text.length}",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF909090)),
                ),
              ],
            ),
          ),
          TextField(
            onChanged: (value) => setState(() {
              kegiatanController.text;
            }),
            controller: kegiatanController,
            decoration:
                const InputDecoration(hintText: "Kegiatan yang kamu lakukan"),
          ),
          const SizedBox(height: 30),
          Text(
            "Bukti",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF32344D)),
          ),
          const SizedBox(
            height: 12,
          ),
          Visibility(
            visible: selectedFile != null,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  color: const Color(0xFFDFF3FF),
                  borderRadius: BorderRadius.circular(6),
                  border:
                      Border.all(color: const Color(0xFF006DAD), width: 1.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color(0xFFFFFFFF), width: 1.5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        (selectedFile != null)
                            ? selectedFile as File
                            : File("a"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (selectedFile != null)
                                ? selectedFile!.path.split('/').last
                                : "",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF006DAD),
                            ),
                          ),
                          Text(
                            (selectedFile != null)
                                ? "${(selectedFile!.lengthSync() / (1024 * 1024)).toStringAsFixed(2)} MB"
                                : "",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF006DAD),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          selectedFile = null;
                        }),
                        child: const Icon(
                          Icons.delete,
                          color: Color(0xFF006DAD),
                          size: 24,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () => _pickFiles(),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF068DDC), width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
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
                    (selectedFile == null) ? "Tambah bukti" : "Ganti bukti",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4D4D4D)),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              if (selectedFile == null || kegiatanController.text.isEmpty) {
                showErrorMessage("Wajib di isi semua!");
              } else {
                if (kegiatanController.text.length < 100) {
                  showErrorMessage("Kegiatan minimal 100 karakter");
                } else {
                  journal
                      .postJournal(
                    kegiatanController.text,
                    selectedFile!,
                  )
                      .then((value) {
                    if (value.status == 200) {
                      showSuccessMessage(value.message.toString());
                      Navigation.replaceNamed(routeName: HomeScreen.routeName);
                    } else {
                      showErrorMessage(value.message.toString());
                    }
                  });
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryBlue, borderRadius: BorderRadius.circular(6)),
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(
                  "Kirim",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
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
