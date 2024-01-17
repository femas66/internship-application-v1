import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class StatementLetterScreen extends StatefulWidget {
  static const String routeName = '/statement-letter-screen';
  const StatementLetterScreen({super.key});

  @override
  State<StatementLetterScreen> createState() => _StatementLetterScreenState();
}

class _StatementLetterScreenState extends State<StatementLetterScreen> {
  final box = GetStorage();

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
              Text(
                "Surat Peringatan 1 :",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF32344D)),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () => _dialogBuilder(context),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFD9D9D9)),
                  child: ClipRRect(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Keterangan",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF32344D)),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "faweweafwafaweefeewafwefwaefwefwafwaefwaefwaefwaefwea",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF32344D)),
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(
                thickness: 1.5,
              ),
            ],
          ),
        ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xFFD9D9D9)),
            child: ClipRRect(),
          ),
        );
      },
    );
  }
}
