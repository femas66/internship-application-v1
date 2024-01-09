import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/navbuttom.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';

class ListAttendanceScreen extends StatefulWidget {
  static const String routeName = "/list-attendance-screen";

  const ListAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<ListAttendanceScreen> createState() => _ListAttendanceScreenState();
}

class _ListAttendanceScreenState extends State<ListAttendanceScreen> {
  late AttendanceService attendance;
  late Future<List<dynamic>> futureListAttendace;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    attendance = AttendanceService();
    futureListAttendace = attendance.getAttendance();
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
                    margin: EdgeInsets.only(right: 22, left: 22),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Halaman Absensi",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  FutureBuilder(
                      future: futureListAttendace,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Text("Belum absen");
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: ((context, index) {
                                  final item = snapshot.data![index];
                                  return Container(
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
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    ),
                                    padding:
                                        EdgeInsets.fromLTRB(12, 20, 12, 20),
                                    margin: EdgeInsets.fromLTRB(22, 0, 22, 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)),
                                                color: primaryYellow,
                                              ),
                                              margin: EdgeInsets.only(left: 6),
                                              width: 40,
                                              height: 40,
                                              child: Center(
                                                child: Text(
                                                  item.status,
                                                  style: GoogleFonts.poppins(
                                                      color: whiteColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              item.date.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: primaryYellow,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          margin: EdgeInsets.only(right: 6),
                                          padding:
                                              EdgeInsets.fromLTRB(16, 6, 16, 6),
                                          child: Center(
                                            child: Text(
                                              item.status.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: whiteColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }));
                          }
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          print("Error: ${snapshot.error}");
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        }
                      })),
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
