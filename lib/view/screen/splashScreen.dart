import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/splashController.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // No need to call _checkLoginStatus here; it will be handled by SplashController
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logoph.png', width: 600, height: 600),
            // Optional: Add a loading indicator here
          ],
        ),
      ),
    );
  }
}
