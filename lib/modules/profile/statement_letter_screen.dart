import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/services/profile/sp_service.dart';

class StatementLetterScreen extends StatefulWidget {
  static const String routeName = '/statement-letter-screen';
  const StatementLetterScreen({super.key});

  @override
  State<StatementLetterScreen> createState() => _StatementLetterScreenState();
}

class _StatementLetterScreenState extends State<StatementLetterScreen> {
  final box = GetStorage();
  late SpService sp;

  late Future<List> futureListSp;

  @override
  void initState() {
    super.initState();
    sp = SpService();
    futureListSp = sp.getSp();
  }

  @override
  Widget build(BuildContext context) {
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
                  border: Border.all(color: const Color(0xFF9A9A9A), width: 1)),
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
                    "Halaman Surat Peringatan",
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
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 180,
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF389BD6),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "Surat Peringatan 1",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Surat ini di berikan di karenakan membuat kesalahanblablabla dan bla bla bla.....",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Lihat Surat Peringatan",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF389BD6)),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 24),
                  child: Image.asset(
                    'assets/icons/no-sp.png',
                    width: 80,
                  ),
                ),
                Text(
                  "Data Surat Peringatan Kosong",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4A4A4A)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
