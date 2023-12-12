import 'package:flutter/material.dart';

class JournalDetailScreen extends StatefulWidget {
  static const String routeName = '/journal-detail-screen';
  const JournalDetailScreen({super.key});

  @override
  State<JournalDetailScreen> createState() => _JournalDetailScreenState();
}

class _JournalDetailScreenState extends State<JournalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final journal = args['journal'];
    return Scaffold(
      appBar: AppBar(title: Text("Detail jurnal")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Tanggal : ${journal.date}"),
            SizedBox(
              height: 12,
            ),
            Text("Kegiatan : ${journal.activity}"),
            Image.network(journal.image)
          ]),
    );
  }
}
