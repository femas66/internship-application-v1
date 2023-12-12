import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pkl_apps/modules/journal/journal_screen.dart';
import 'package:pkl_apps/services/journal_service.dart';
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
    // TODO: implement initState
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
      appBar: AppBar(title: Text("Upload jurnal")),
      body: ListView(children: [
        Container(
          child: Card(
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: kegiatanController,
                maxLines: 8, //or null
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your text here"),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _pickFiles(),
          child: Text("Upload gambar"),
        ),
        (selectedFile != null)
            ? Container(
                margin: EdgeInsets.fromLTRB(22, 22, 22, 22),
                child: Image.file(selectedFile as File))
            : Container(),
        ElevatedButton(
            onPressed: () {
              if (selectedFile == null || kegiatanController.text.isEmpty) {
                showErrorMessage("Wajib di isi semua deck!");
              } else {
                journal
                    .postJournal(kegiatanController.text, selectedFile as File)
                    .then((value) {
                  if (value.status == 200) {
                    showSuccessMessage("Berhasil mengirim jurnal");
                    Navigator.pushReplacementNamed(
                        context, JournalScreen.routeName);
                  } else {
                    showErrorMessage(value.message.toString());
                  }
                });
              }
            },
            child: Text("Kirim")),
      ]),
    );
  }
}
