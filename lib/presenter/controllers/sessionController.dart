import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  RxInt seconds = 0.obs;
  final int studyDuration = 25 * 60;
  final int breakDuration = 5 * 60;
  RxBool isStudyPeriod = true.obs;
  RxBool isRunning = false.obs; // New observable to track if the timer is running
  Timer? _timer;

  void startTimer() {
    isRunning.value = true; // Mark the timer as running
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        switchPeriod();
      }
    });
  }

  void stopTimer() {
    isRunning.value = false; // Mark the timer as stopped
    _timer?.cancel(); // Cancel the current timer
  }

  void switchPeriod() {
    stopTimer(); // Stop the timer
    isStudyPeriod.value = !isStudyPeriod.value;
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;
    showReminderDialog(); // Show the dialog
  }

  void showReminderDialog() {
    Get.defaultDialog(
      title: isStudyPeriod.value ? 'Préparez-vous à Reprendre le Travail!' : 'Temps de Pause!',
      content: Text(isStudyPeriod.value
          ? 'Votre pause est terminée. Préparez-vous à commencer votre prochaine session de travail !'
          : 'Il est temps de faire une pause de 5 minutes. Profitez de votre repos !'),
      confirm: TextButton(
        onPressed: () {
          Get.back(); // Fermer la boîte de dialogue
        },
        child: Text('OK'),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.cyan,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    stopTimer(); // Stop the timer when the controller is disposed
    super.onClose();
  }
}
