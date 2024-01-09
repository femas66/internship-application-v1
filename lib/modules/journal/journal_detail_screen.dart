import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/data/journal_model.dart';

class JournalDetailScreen extends StatefulWidget {
  static const String routeName = '/journal-detail-screen';
  const JournalDetailScreen({super.key});

  @override
  State<JournalDetailScreen> createState() => _JournalDetailScreenState();
}

class _JournalDetailScreenState extends State<JournalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final journal = ModalRoute.of(context)!.settings.arguments as JournalModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryBlue,
        title: Image.asset(
          "assets/icons/logo-hummatech.png",
          width: 200,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(children: <Widget>[
            SizedBox(
              height: 22,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(journal.image.toString())),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tanggal",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                journal.date.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kegiatan : ",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              journal.activity.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 24,
            ),
          ]),
        ),
      ),
    );
  }
}
