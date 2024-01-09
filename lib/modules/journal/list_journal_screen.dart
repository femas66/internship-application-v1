import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/navbuttom.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';
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
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    journalService = JournalService();
    futureListJournal = journalService.getJournal(limit: "250");
    _selectedIndex = 0;
  }

  final box = GetStorage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: secondaryBlue,
        title: Image.asset(
          "assets/icons/logo-hummatech.png",
          width: 200,
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                      margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Halaman Jurnal",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )),
                  SizedBox(
                    height: 22,
                  ),
                  FutureBuilder(
                      future: futureListJournal,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          print("Error: ${snapshot.error}");
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
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
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    JournalDetailScreen.routeName,
                                    arguments: itemJournal,
                                  );
                                },
                                child: Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: shadowColor,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                                  margin: EdgeInsets.fromLTRB(22, 0, 22, 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                itemJournal.date.toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                itemJournal.activity,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 22,
                                      ),
                                      Container(
                                          width: 100,
                                          child: Image.network(
                                              (itemJournal.image))),
                                    ],
                                  ),
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
          PermissionFormScreen(),
          UploadJournalScreen(),
        ],
      ),
      bottomNavigationBar: NavBottom(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
