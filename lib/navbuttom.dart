import 'package:flutter/material.dart';
import 'package:pkl_apps/modules/home/home_screen.dart';
import 'package:pkl_apps/modules/home/permission_form_screen.dart';

class NavBottom extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBottom({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Izin',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        onItemTapped(index);
        switch (index) {
          case 0:
            break;
          case 1:
            break;
        }
      },
    );
  }
}
