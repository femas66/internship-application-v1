import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkl_apps/firebase_options.dart';
import 'package:pkl_apps/modules/attendance/list_attendance_screen.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';
import 'package:pkl_apps/modules/journal/edit_journal_screen.dart';
import 'package:pkl_apps/modules/journal/journal_detail_screen.dart';
import 'package:pkl_apps/modules/journal/list_journal_screen.dart';
import 'package:pkl_apps/modules/journal/upload_journal_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/modules/notification/list_notification_screen.dart';
import 'package:pkl_apps/modules/profile/edit_profile_screen.dart';
import 'package:pkl_apps/modules/profile/profile_screen.dart';
import 'package:pkl_apps/modules/profile/statement_letter_screen.dart';
import 'package:pkl_apps/modules/splash/splash_screen.dart';
import 'package:pkl_apps/utils/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseApi().initNotifications();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PKL Apps',
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        UploadJournalScreen.routeName: (context) => const UploadJournalScreen(),
        JournalDetailScreen.routeName: (context) => const JournalDetailScreen(),
        PermissionFormScreen.routeName: (context) =>
            const PermissionFormScreen(),
        ListAttendanceScreen.routeName: (context) =>
            const ListAttendanceScreen(),
        ListJournalScreen.routeName: (context) => const ListJournalScreen(),
        EditJournalScreen.routeName: (context) => const EditJournalScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        EditProfileScreen.routeName: (context) => const EditProfileScreen(),
        ListNotificationScreen.routeName: (context) =>
            const ListNotificationScreen(),
        StatementLetterScreen.routeName: (context) =>
            const StatementLetterScreen()
      },
    );
  }
}
