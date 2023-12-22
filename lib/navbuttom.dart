import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, '/absen');
            break;
          case 1:
            Navigator.pushNamed(context, '/izin');
            break;
        }
      },
    );
  }
}
