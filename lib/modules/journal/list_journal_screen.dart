import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/journal/edit_journal_screen.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/services/journal_service.dart';

class ListJournalScreen extends StatefulWidget {
  static const String routeName = "/list-journal-screen";

  const ListJournalScreen({super.key});

  @override
  State<ListJournalScreen> createState() => _ListJournalScreenState();
}

class _ListJournalScreenState extends State<ListJournalScreen> {
  late JournalService journalService;
  late Future<List<dynamic>> futureListJournal;

  @override
  void initState() {
    super.initState();
    journalService = JournalService();
    futureListJournal = journalService.getJournal(limit: "250");
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, UploadJournalScreen.routeName),
                child: Container(
                  margin: EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border:
                            Border.all(color: Color(0xFF389BD6), width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Color(0xFF389BD6),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Tambah Jurnal",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color(0xFF389BD6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Daftar Jurnal",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF32344D)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFF389BD6))),
                      child: Row(children: [
                        Text(
                          "yyyy-mm-dd",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF32344D)),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(Icons.calendar_month_outlined,
                            size: 20, color: Color(0xFF32344D))
                      ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder(
                  future: futureListJournal,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      print("Error: ${snapshot.error}");
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text("No data available"),
                      );
                    } else {
                      final dataJournal = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataJournal.length,
                        itemBuilder: (context, index) {
                          final itemJournal = dataJournal[index];
                          return Container(
                            height: 160,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: whiteColor,
                              boxShadow: [
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
                            padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          itemJournal.date.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          itemJournal.activity,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                JournalDetailScreen.routeName,
                                                arguments: itemJournal,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Color(0x10389BD6),
                                              ),
                                              width: 30,
                                              height: 30,
                                              child: Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Color(0xFF389BD6),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Visibility(
                                            visible: itemJournal.activity !=
                                                "Kosong",
                                            child: InkWell(
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  EditJournalScreen.routeName,
                                                  arguments: itemJournal),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Color(0x10FFC412),
                                                ),
                                                width: 30,
                                                height: 30,
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Color(0xFFFFC412),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                Container(
                                    width: 100,
                                    child: Image.network((itemJournal.image))),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}
