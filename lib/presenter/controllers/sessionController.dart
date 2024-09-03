import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  RxInt seconds = 0.obs;
  final int studyDuration = 25 * 60;
  final int breakDuration = 5 * 60;
  RxBool isStudyPeriod = true.obs;
  RxBool isRunning = false.obs;
  Timer? _timer;

  void startTimer() {
    if (_timer != null) _timer!.cancel(); // Cancel any existing timer before starting a new one
    isRunning.value = true;
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        switchPeriod();
      }
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel(); // Cancel the timer immediately
    }
    isRunning.value = false; // Update the UI to reflect that the timer has stopped
  }

  void switchPeriod() {
    stopTimer(); // Stop the timer before switching the period
    isStudyPeriod.value = !isStudyPeriod.value;
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;
    showReminderDialog(); // Show the dialog
  }

  void showReminderDialog() {
    Get.defaultDialog(
      title: isStudyPeriod.value ? 'Préparez-vous à Reprendre le Travail!' : 'Temps de Pause!',
      content: Center(
        child: Text(
          isStudyPeriod.value
              ? 'Votre pause est terminée. Préparez-vous à commencer votre prochaine session de travail !'
              : 'Il est temps de faire une pause de 5 minutes. Profitez de votre repos !',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back(); // Close the dialog
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.cyan,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text('OK'),
      ),
    );
  }

  @override
  void onClose() {
    stopTimer(); // Ensure the timer is stopped when the controller is disposed
    super.onClose();
  }
}
