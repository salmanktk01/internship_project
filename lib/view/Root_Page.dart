import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/Nav_Controller.dart';
import 'package:internship_project/view/Home_Screen.dart';

import 'package:internship_project/view/QR_Screen.dart';
import 'package:internship_project/view/Setting_Screen.dart';

class BottomNavBar extends StatelessWidget {
  final navbar = Get.find<navbarcontroller>();
  List<Widget> widgetoption = [
    HomeScreen(),
    const QrScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: widgetoption.elementAt(navbar.navindex.value),
        ),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: bottomnav(context)),
    );
  }

  BottomNavigationBar bottomnav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navbar.navindex.value,
      onTap: navbar.changenav,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.qr_code_2_outlined,
              size: 35,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
            size: 35,
          ),
          label: '',
        ),
      ],
      backgroundColor: const Color(0xff2C7890),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
    );
  }
}
