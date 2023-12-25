import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/journal/journal_screen.dart';
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
  @override
  void initState() {
    super.initState();
    journal = JournalService();
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
      appBar: AppBar(
        backgroundColor: secondaryBlue,
        title: Image.asset(
          "assets/icons/Logo Hummatech.png",
          width: 200,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 22.0, left: 22),
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "Pengumpulan Jurnal",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const Text(
              "Masukan Kegiatan",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 224, 224, 224),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: kegiatanController,
                maxLines: 8,
                decoration: const InputDecoration.collapsed(
                  hintText: "Kegiatan....",
                ),
              ),
            ),
          ),
          SizedBox(height: 22.0),
          Text(
            "Bukti Pekerjaan",
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Visibility(
            visible: selectedFile == null,
            child: InkWell(
              onTap: () => _pickFiles(),
              child: Container(
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                height: 40,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file_rounded,
                      color: whiteColor,
                      weight: 8,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Pilih File",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              ),
            ),
          ),
          Visibility(
            visible: selectedFile != null,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: primaryBlue, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          (selectedFile != null)
                              ? selectedFile!.path.split('/').last
                              : "",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedFile = null;
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Visibility(
            visible: selectedFile != null,
            child: InkWell(
              onTap: () {
                if (selectedFile == null || kegiatanController.text.isEmpty) {
                  showErrorMessage("Wajib di isi semua deck!");
                } else {
                  showLoading();
                  journal
                      .postJournal(
                    kegiatanController.text,
                    selectedFile!,
                  )
                      .then((value) {
                    stopLoading();
                    if (value.status == 200) {
                      showSuccessMessage("Berhasil mengirim jurnal");
                      Navigator.pushReplacementNamed(
                        context,
                        JournalScreen.routeName,
                      );
                    } else {
                      showErrorMessage(value.message.toString());
                    }
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_rounded,
                        color: whiteColor,
                        weight: 8,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Kirim",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
