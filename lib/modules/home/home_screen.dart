import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/attendance/list_attendance_screen.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/list_journal_screen.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/services/journal_service.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.co_present_outlined,
    title: 'Absensi',
  ),
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.menu_book_rounded,
    title: 'Jurnal',
  ),
];

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int visit = 1;
  double height = 30;
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0xFFFFFFFF);

  late LoginService login;
  late JournalService journalService;
  late AttendanceService attendance;
  late Future<List> futureListAttendaceToday;
  late Future<List<dynamic>> futureListJournal;

  @override
  void initState() {
    super.initState();
    login = LoginService();
    login.saveFCM();
    journalService = JournalService();
    attendance = AttendanceService();
    futureListJournal = journalService.getJournal(limit: "3");
    futureListAttendaceToday = attendance.getAttendanceToday();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                backgroundImage: NetworkImage(box.read('photo')),
              ),
            ),
          ],
          backgroundColor: const Color(0xFF389BD6),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      box.read('name'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      box.read('school'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: visit,
        children: [
          ListAttendanceScreen(),
          ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 24,
                          decoration:
                              const BoxDecoration(color: Color(0xFF389BD6)),
                          child: const Text(""),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Statistik",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                              color: Color(0x250EAD00),
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "222",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFF32344D),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Total absensi",
                                  style: GoogleFonts.poppins(
                                    color: Color(
                                      0xFF696969,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                              color: Color(0x250EAD00),
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "222",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFF32344D),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Total absensi",
                                  style: GoogleFonts.poppins(
                                    color: Color(
                                      0xFF696969,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                              color: Color(0x250EAD00),
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "222",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFF32344D),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Total absensi",
                                  style: GoogleFonts.poppins(
                                    color: Color(
                                      0xFF696969,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          height: 88,
                          width: 88,
                          decoration: BoxDecoration(
                              color: Color(0x250EAD00),
                              borderRadius: BorderRadius.circular(6)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "222",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Color(0xFF32344D),
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Total absensi",
                                  style: GoogleFonts.poppins(
                                    color: Color(
                                      0xFF696969,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 24,
                          decoration:
                              const BoxDecoration(color: Color(0xFF389BD6)),
                          child: const Text(""),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Absensi Hari Ini",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, UploadJournalScreen.routeName);
                          },
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
                      ),
                    ],
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
                              "Absensi hari ini",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ListAttendanceScreen.routeName);
                          },
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  FutureBuilder(
                      future: futureListAttendaceToday,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Anda belum absen tab",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            if (snapshot.data![0].attendanceDetail != null) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      snapshot.data![0].attendanceDetail.length,
                                  itemBuilder: ((context, index) {
                                    final item = snapshot
                                        .data![0].attendanceDetail[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
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
                                      margin:
                                          EdgeInsets.fromLTRB(22, 0, 22, 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  color: primaryBlue,
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                width: 40,
                                                height: 40,
                                                child: Center(
                                                  child: Text(
                                                    'H',
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
                                                item.time.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: primaryBlue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            margin: EdgeInsets.only(right: 6),
                                            padding: EdgeInsets.fromLTRB(
                                                16, 6, 16, 6),
                                            child: Center(
                                              child: Text(
                                                item.status.toString(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: whiteColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }));
                            } else {
                              final item = snapshot.data![0];
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
                                              item.status,
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
                                          item.status,
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
                            }
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
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 12, 22, 0),
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
                              "Jurnal",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ListJournalScreen.routeName);
                          },
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
          const ListAttendanceScreen(),
        ],
      ),
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: bgColor,
        color: color2,
        colorSelected: Colors.white,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        top: -28,
        animated: false,
        itemStyle: ItemStyle.circle,
        chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.smoothEdge),
      ),
    );
  }
}
