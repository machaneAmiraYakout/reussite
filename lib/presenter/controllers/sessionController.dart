import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SessionController extends GetxController with WidgetsBindingObserver {
  late DateTime sessionStartTime;
  Timer? sessionTimer;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    startSession();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    sessionTimer?.cancel();
    super.onClose();
  }

  void startSession() {
    sessionStartTime = DateTime.now();
    sessionTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      final sessionDuration = DateTime.now().difference(sessionStartTime);
      if (sessionDuration.inMinutes >= 30) {
        showBreakReminder();
        timer.cancel(); // Stop the timer after showing the reminder
      }
    });
  }

  void endSession() {
    sessionTimer?.cancel();
  }

  void showBreakReminder() {
    Get.dialog(
      AlertDialog(
        title: Text('Take a Break'),
        content: Text('You have been using the app for over 30 minutes. Consider taking a break.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is in background, stop tracking time
      endSession();
    } else if (state == AppLifecycleState.resumed) {
      // App comes back to foreground, start tracking time again
      startSession();
    }
  }
}
