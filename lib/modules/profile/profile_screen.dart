import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/data/profile.dart';
import 'package:pkl_apps/modules/profile/edit_profile_screen.dart';
import 'package:pkl_apps/modules/profile/statement_letter_screen.dart';
import 'package:pkl_apps/services/profile/profile_service.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final box = GetStorage();

  late ProfileService profileService;
  late Future<Profile> futureProfile;

  @override
  void initState() {
    profileService = ProfileService();
    futureProfile = profileService.getProfile();
    super.initState();
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
                      "Halaman Profile",
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
                height: 22,
              ),
              FutureBuilder(
                  future: futureProfile,
                  builder: (((context, snapshot) {
                    if (snapshot.hasData) {
                      final item = snapshot.data!;
                      return Column(
                        children: [
                          SizedBox(
                            height: 180,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF389BD6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  height: 120,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  top: 60,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 4),
                                              ),
                                              child: ClipOval(
                                                child: Image.network(
                                                  item.photo,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: InkWell(
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                        context,
                                                        EditProfileScreen
                                                            .routeName),
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF389BD6),
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: const Icon(
                                                      Icons
                                                          .mode_edit_outline_outlined,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )),
                                              ))
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                box.read('name'),
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: const Color(0xFF32344D),
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFBFE7FF),
                                  border: Border.all(
                                      color: const Color(0xFF389BD6), width: 1),
                                ),
                                child: Text(
                                  box.read('school'),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF32344D),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFBFE7FF),
                                  border: Border.all(
                                      color: const Color(0xFF389BD6), width: 1),
                                ),
                                child: Text(
                                  "SP : ${item.sp}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF32344D),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(children: <Widget>[
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range_outlined,
                                        color: Color(0xFF000000),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        item.birthday,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF32344D)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email_outlined,
                                        color: Color(0xFF000000),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        item.email,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF32344D)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone_outlined,
                                        color: Color(0xFF000000),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        item.phoneNumber,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF32344D)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ]),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, StatementLetterScreen.routeName),
                                  child: Container(
                                    width: 186,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF389BD6),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: Text(
                                        "Cek Surat Peringatan",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                  })))
            ],
          ),
        ));
  }
}
