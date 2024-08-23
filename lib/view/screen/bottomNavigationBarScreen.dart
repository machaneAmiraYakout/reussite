import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/profileScreen.dart';
import '../../presenter/controllers/navigationController.dart';
import 'homeScreen.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: navigationController.selectedIndex.value,
        selectedItemColor: Colors.cyan,
        onTap: (index) {
          navigationController.changePage(index);
        },
      )),
      body: Obx(() {
        switch (navigationController.selectedIndex.value) {
          case 0:
            return HomeScreen();
          case 1:
            return ProfileScreen();
          default:
            return HomeScreen();
        }
      }),
    );
  }
}