import 'package:flutter/material.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginService login;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LoginService();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
              onPressed: () {
                login
                    .doLogin(emailController.text, passwordController.text)
                    .then((value) {
                  print(value.status);
                  print("NAME : ${value.email}");
                  if (value.status == 200) {
                    print("Berhasil login");
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else {
                    showErrorMessage("Username / password salah");
                    print("Gagal login");
                  }
                });
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
