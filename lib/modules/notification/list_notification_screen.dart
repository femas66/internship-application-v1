import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/services/notification/notification_service.dart';

class ListNotificationScreen extends StatefulWidget {
  static const String routeName = '/list-notification-screen';
  const ListNotificationScreen({super.key});

  @override
  State<ListNotificationScreen> createState() => _ListNotificationScreenState();
}

class _ListNotificationScreenState extends State<ListNotificationScreen> {
  final box = GetStorage();
  late LoginService login;
  late NotificationService notification;

  late Future<List> futureListNotification;

  @override
  void initState() {
    super.initState();
    notification = NotificationService();
    futureListNotification = notification.getNotification();
    login = LoginService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
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
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, ProfileScreen.routeName),
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
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  child: InkWell(
                    onTap: () => login.logout().then((value) {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    }),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF9A9A9A), width: 1)),
              child: Center(
                child: Text(
                  "Notifikasi",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            FutureBuilder(
                future: futureListNotification,
                builder: (((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC3E9FF),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.title,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF32344D),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      item.createdAt,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF32344D),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.message,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF555555)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
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
          ]),
        ),
      ),
    );
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
