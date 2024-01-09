import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/widgets/loading.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  late LoginService loginService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginService = LoginService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/icons/logo-hummatech.png",
                width: 280,
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                'assets/icons/illustration-login.svg',
                width: 300,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Email", prefixIcon: Icon(Icons.email)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 12, 30, 0),
                child: InkWell(
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      showLoading();
                      loginService
                          .doLogin(
                              emailController.text, passwordController.text)
                          .then((value) {
                        stopLoading();
                        if (value.status == 200) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        } else {
                          showErrorMessage("Email / password salah!");
                          passwordController.text = "";
                        }
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
