import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/navbuttom.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';
import 'package:pkl_apps/modules/journal/journal_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/services/auth/login_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LoginService login;
  late AttendanceService attendance;
  late Future<List<dynamic>> futureListAttendace;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    login = LoginService();
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: secondaryBlue,
                    ),
                    height: 70,
                    width: double.infinity,
                    child: Image.asset("assets/icons/Logo Hummatech.png"),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300'),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                box.read('name'),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                "SMKN 1 LUMAJANG",
                                style: GoogleFonts.poppins(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: primaryBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Center(
                                child: Text(
                              "Absen",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "Jurnal",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_rounded,
                              color: primaryBlue,
                              size: 30,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Absensi",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Text(
                          "Lihat semua",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: blackColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  FutureBuilder<List>(
                    future: futureListAttendace,
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
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
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
                              padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
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
                                            color: primaryBlue,
                                          ),
                                          margin: EdgeInsets.only(left: 6),
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              "H",
                                              style: GoogleFonts.poppins(
                                                  color: whiteColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
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
                                            color: primaryBlue,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        margin: EdgeInsets.only(right: 6),
                                        padding:
                                            EdgeInsets.fromLTRB(16, 6, 16, 6),
                                        child: Center(
                                            child: Text(
                                          item.information.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: whiteColor,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                  ]),
                            );
                            // child: ListTile(
                            //   leading: Icon(Icons.calendar_today),
                            //   title: Text(
                            //     item.information.toString(),
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            //   subtitle: Text(
                            //     item.date.toString(),
                            //     style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.grey[600],
                            //     ),
                            //   ),
                            // ),
                            // );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          PermissionFormScreen(),
          JournalScreen(),
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
