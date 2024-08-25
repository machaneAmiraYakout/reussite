import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  // Declare seconds as an observable RxInt
  RxInt seconds = 0.obs;

  // Declare study and break durations
  final int studyDuration = 25 * 60; // 25 minutes in seconds
  final int breakDuration = 5 * 60; // 5 minutes in seconds

  // Observable to keep track of whether the current period is study or break
  RxBool isStudyPeriod = true.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer(); // Start the timer when the controller is initialized
  }

  void startTimer() {
    // Initialize the timer for the study or break period
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        // Switch periods when the timer reaches 0
        switchPeriod();
      }
    });
  }

  void switchPeriod() {
    // Stop the current timer
    _timer?.cancel();

    // Toggle between study and break periods
    isStudyPeriod.value = !isStudyPeriod.value;

    // Set the appropriate duration based on the new period
    seconds.value = isStudyPeriod.value ? studyDuration : breakDuration;

    // Notify the user to take a break or resume studying
    showReminderDialog();

    // Restart the timer
    startTimer();
  }

  void showReminderDialog() {
    // Affiche une boîte de dialogue lorsque la période se termine
    Get.defaultDialog(
      title: isStudyPeriod.value ?'Préparez-vous à Reprendre le Travail!' : 'Temps de Pause!',
      content: Text(isStudyPeriod.value
          ?  'Votre pause est terminée. Préparez-vous à commencer votre prochaine session de travail !'
          :'Il est temps de faire une pause de 5 minutes. Profitez de votre repos !'),
      confirm: TextButton(
        onPressed: () {
          Get.back(); // Fermer la boîte de dialogue
        },
        child: Text('OK'),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.cyan, // Text color for the button
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding for the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
      ),
    );
  }




  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }
}
