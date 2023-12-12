import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';
import 'package:pkl_apps/modules/journal/journal_screen.dart';
import 'package:pkl_apps/modules/login/login_screen.dart';
import 'package:pkl_apps/services/attendance_service.dart';
import 'package:pkl_apps/services/auth/login_service.dart';
import 'package:pkl_apps/widgets/message/errorMessage.dart';
import 'package:pkl_apps/widgets/message/successMessage.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LoginService login;
  late AttendanceService attendance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LoginService();
    attendance = AttendanceService();
  }

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  login.logout().then((value) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  });
                },
                child: Text("Logout"),
              ),
              Center(
                child: Text("Selamat datang ${box.read('name')}"),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      attendance.postAttendance().then((value) {
                        if (value.status == 200) {
                          showSuccessMessage(value.message.toString());
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        } else {
                          showErrorMessage(value.message.toString());
                        }
                      });
                    },
                    child: Text("Absen"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, PermissionFormScreen.routeName);
                    },
                    child: Text("Izin"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, JournalScreen.routeName);
                    },
                    child: Text("Jurnal"),
                  ),
                ],
              ),
              FutureBuilder<List>(
                future: attendance.getAttendance(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print("Error: ${snapshot.error}");
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("No data available"),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return Container(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          margin: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.information.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Expanded(
                                child: Text(
                                  item.date.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
