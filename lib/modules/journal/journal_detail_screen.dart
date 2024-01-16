import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/data/journal_model.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/modules/notification/list_notification_screen.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/widgets/loading.dart';

class JournalDetailScreen extends StatefulWidget {
  static const String routeName = '/journal-detail-screen';
  const JournalDetailScreen({super.key});

  @override
  State<JournalDetailScreen> createState() => _JournalDetailScreenState();
}

class _JournalDetailScreenState extends State<JournalDetailScreen> {
  final box = GetStorage();
  late LoginService login;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LoginService();
  }

  @override
  Widget build(BuildContext context) {
    final journal = ModalRoute.of(context)!.settings.arguments as JournalModel;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: const BackButton(color: Colors.white),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(
                  context, ListNotificationScreen.routeName),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFF9A9A9A), width: 1)),
              child: Center(
                child: Text(
                  "Detail Jurnal",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(journal.image.toString())),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tanggal",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF32344D),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                journal.date.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF555555),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kegiatan",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF32344D),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              journal.activity.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xFF555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
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
