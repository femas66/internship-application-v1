import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/base/router/navigation.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/services/profile/profile_service.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/edit-profile-screen';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final box = GetStorage();

  late ProfileService profileService;

  @override
  void initState() {
    super.initState();

    profileService = ProfileService();
  }

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

  TextEditingController noController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final photoArgs = argument['photo'];
    final noArgs = argument['no'];
    noController.text = noArgs;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(color: const Color(0xFF9A9A9A), width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 180,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF389BD6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 120,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: Colors.white, width: 4),
                              ),
                              child: ClipOval(
                                  child: selectedFile == null
                                      ? Image.network(
                                          photoArgs,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          selectedFile as File,
                                          fit: BoxFit.cover,
                                        )),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Foto Profile",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF32344D)),
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
                          border: Border.all(
                              color: const Color(0xFF068DDC), width: 2),
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
                              "Ubah Profile",
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nomor HP",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF32344D)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: noController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                          hintText: "04727427247",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFF068DDC)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFF068DDC)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => profileService
                          .updateProfile(noController.text, selectedFile)
                          .then((value) {
                        if (value.status == 200) {
                          showSuccessMessage(value.message.toString());
                          Navigation.replaceUntilNamed(
                              routeName: ProfileScreen.routeName);
                        } else {
                          showErrorMessage(value.message.toString());
                        }
                      }),
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFF389BD6),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            "Simpan",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
