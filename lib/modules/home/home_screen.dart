import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/attendance/list_attendance_screen.dart';
import 'package:pkl_apps/modules/journal/edit_journal_screen.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/list_journal_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/services/journal_service.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:pkl_apps/widgets/loading.dart';

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
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            shape: const RoundedRectangleBorder(
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
                child: PopUpMenuProfile(
                  menuList: [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Color(0xFF32344D),
                        ),
                        title: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF32344D),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          showLoading();
                          login.logout().then((value) {
                            stopLoading();
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          });
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.output_rounded,
                            color: Color(0xFFE82135),
                          ),
                          title: Text(
                            "Logout",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFFE82135),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(box.read('photo')),
                  ),
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
            const ListAttendanceScreen(),
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
                                fontSize: 16, fontWeight: FontWeight.w500),
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
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                                color: Color(0xFFE7F7E6),
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "222",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Color(0xFF0EAD00),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Total Hadir",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(
                                        0xFF696969,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFAE8),
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "222",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Color(0xFFFFC412),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Total Izin",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                        0xFF696969,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                                color: Color(0xFFFDE9EB),
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "222",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Color(0xFFE82135),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Total Alpha",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                        0xFF696969,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                                color: Color(0xFFD2EEFF),
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "222",
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Color(0xFF006DAD),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Total Jurnal",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(
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
                                fontSize: 16, fontWeight: FontWeight.w500),
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
                                  color: Color(0x10FFC412),
                                ),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.warning_amber_rounded,
                                            color: Color(0xFFFFC412),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            "Belum Melakukan Absensi",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Color(0xFFFFC412),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              if (snapshot.data![0].attendanceDetail != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot
                                        .data![0].attendanceDetail.length,
                                    itemBuilder: ((context, index) {
                                      final subItem = snapshot
                                          .data![0].attendanceDetail[index];
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 12, 12, 12),
                                        margin: const EdgeInsets.fromLTRB(
                                            12, 0, 12, 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(6)),
                                                    color: Color(0x100EAD00),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      left: 6),
                                                  width: 50,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      'H',
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xFF0EAD00),
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      subItem.date.toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: const Color(
                                                              0xFF32344D),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      subItem.time.toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: const Color(
                                                              0xFF696969),
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0x100EAD00),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              margin: const EdgeInsets.only(
                                                  right: 6),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              child: Center(
                                                child: Text(
                                                  subItem.status.toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Color(0xFF0EAD00),
                                                      fontWeight:
                                                          FontWeight.w600),
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
                    const SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 24,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF389BD6)),
                                child: const Text(""),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Jurnal Harian",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visit = 2;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Text(
                                "Lihat semua >",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF32344D)),
                              ),
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
                              physics: const NeverScrollableScrollPhysics(),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 20, 18, 20),
                                  margin:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                      JournalDetailScreen
                                                          .routeName,
                                                      arguments: itemJournal,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: Color(0x10389BD6),
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color: Color(0xFF389BD6),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Visibility(
                                                  visible:
                                                      itemJournal.activity !=
                                                          "Kosong",
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Navigator.pushNamed(
                                                            context,
                                                            EditJournalScreen
                                                                .routeName,
                                                            arguments:
                                                                itemJournal),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color: const Color(
                                                            0x10FFC412),
                                                      ),
                                                      width: 30,
                                                      height: 30,
                                                      child: const Icon(
                                                        Icons.edit,
                                                        color:
                                                            Color(0xFFFFC412),
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
                                          child: Image.network(
                                              (itemJournal.image))),
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
            const ListJournalScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(255, 210, 210, 210),
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomBarInspiredInside(
            items: items,
            backgroundColor: bgColor,
            color: color2,
            colorSelected: Colors.white,
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
            chipStyle: const ChipStyle(
                convexBridge: true,
                isHexagon: false,
                notchSmoothness: NotchSmoothness.softEdge),
            itemStyle: ItemStyle.circle,
            animated: true,
          ),
        ));
  }
}

class PopUpMenuProfile extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMenuProfile({super.key, required this.menuList, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
