import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
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

  @override
  void initState() {
    super.initState();
    attendance = AttendanceService();
    futureListAttendace = attendance.getAttendance();
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
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Halaman Absen",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF32344D)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PermissionFormScreen.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF389BD6),
                            borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Center(
                            child: Text(
                          "Buat Izin",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 6, bottom: 8),
                child: const Divider(
                  color: Color(0xFFA1A1A1),
                ),
              ),
              FutureBuilder(
                  future: futureListAttendace,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
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
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
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
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              final item = snapshot.data![index];
                              if (item.attendanceDetail != null) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: item.attendanceDetail.length,
                                  itemBuilder: ((context, index) {
                                    final subItem =
                                        item.attendanceDetail[index];
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
                                                decoration: const BoxDecoration(
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
                                                color: const Color(0x100EAD00),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            margin:
                                                const EdgeInsets.only(right: 6),
                                            padding: const EdgeInsets.fromLTRB(
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
                                  }),
                                );
                              } else {
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
                              }
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
    );
  }
}
