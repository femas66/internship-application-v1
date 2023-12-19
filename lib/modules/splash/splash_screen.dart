import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (box.read('isLogin') ?? false == true) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/icons/SplashLogo.png',
              width: 200,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Developed by, ",
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Femas Akbar Faturrohim",
                      style: GoogleFonts.poppins(
                          color: primaryBlue,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Team ",
                      style: GoogleFonts.poppins(
                          fontSize: 8, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Yowes Iki",
                      style: GoogleFonts.poppins(
                          color: primaryBlue,
                          fontSize: 8,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
