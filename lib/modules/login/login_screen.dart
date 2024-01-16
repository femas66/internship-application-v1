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
      body: Stack(children: [
        Positioned(
          left: 0,
          top: 0,
          child: Image.asset(
            'assets/images/gelombang-1.png',
            width: 250,
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Image.asset(
                'assets/images/logo-name.png',
                width: 200,
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: "Email", prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password", prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
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
                              return;
                            } else {
                              showErrorMessage("Email / password salah!");
                              passwordController.text = "";
                            }
                          });
                        }
                      },
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            color: primaryBlue,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Center(
                            child: Text(
                          "Masuk",
                          style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/gelombang-2.png',
            width: 200,
          ),
        ),
      ]),
    );
  }
}
