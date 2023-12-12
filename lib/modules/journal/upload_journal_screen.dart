import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pkl_apps/modules/journal/journal_screen.dart';
import 'package:pkl_apps/services/journal_service.dart';
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class UploadJournalScreen extends StatefulWidget {
  static const String routeName = '/upload-journal-screen';
  const UploadJournalScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(title: Text("Upload Jurnal")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Deskripsi",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
                        color: Color.fromARGB(255, 224, 224, 224),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: kegiatanController,
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                  hintText: "Enter your text here",
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Bukti",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => _pickFiles(),
            icon: Icon(Icons.upload_rounded),
            label: Text("Upload"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          if (selectedFile != null)
            Container(
              margin: EdgeInsets.all(22),
              child: Image.file(selectedFile!),
            ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (selectedFile == null || kegiatanController.text.isEmpty) {
                showErrorMessage("Wajib di isi semua deck!");
              } else {
                showLoading();
                journal.postJournal(
                  kegiatanController.text,
                  selectedFile!,
                ).then((value) {
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
            child: Text("Kirim"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}