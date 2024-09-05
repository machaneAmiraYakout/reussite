import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/sessionController.dart';
import '../widget/colors.dart';

class TimerScreen extends StatelessWidget {
  final SessionController sessionController = Get.find<SessionController>();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_circle_left,
            color: Colors.cyan,
            size: screenWidth * 0.1, // Responsive icon size
          ),
        ),
        title: Text(
          'Timer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.05, // Responsive font size
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              int totalSeconds = sessionController.isStudyPeriod.value
                  ? sessionController.studyDuration
                  : sessionController.breakDuration;
              int remainingSeconds = sessionController.seconds.value;
              double progress = remainingSeconds / totalSeconds;

              int hours = remainingSeconds ~/ 3600;
              int minutes = (remainingSeconds % 3600) ~/ 60;
              int seconds = remainingSeconds % 60;

              String formattedTime = '${hours.toString().padLeft(2, '0')}:'
                  '${minutes.toString().padLeft(2, '0')}:'
                  '${seconds.toString().padLeft(2, '0')}';

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pomodoro Technique',
                    style: TextStyle(
                      fontSize: screenWidth * 0.055, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: sessionController.isStudyPeriod.value
                          ? Colors.cyan
                          : Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04), // Responsive spacing
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade50,
                      borderRadius: BorderRadius.circular(screenWidth * 0.05), // Responsive border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.cyan.shade300,
                        width: screenWidth * 0.005, // Responsive border width
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Temps restant: $formattedTime',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive spacing
                        Container(
                          width: screenWidth * 0.5, // Responsive size
                          height: screenWidth * 0.5, // Responsive size
                          decoration: BoxDecoration(
                            color: sessionController.isStudyPeriod.value
                                ? Colors.white
                                : Colors.red,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: screenWidth * 0.3, // Responsive stroke width
                              backgroundColor: Colors.grey.shade100,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                sessionController.isStudyPeriod.value
                                    ? Colors.orange.shade500
                                    : Colors.red.shade800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Obx(() {
                    return SwitchListTile(
                      title: Text(
                        sessionController.isRunning.value ? 'Stop Timer' : 'Start Timer',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: sessionController.isRunning.value ? Colors.orange : Colors.cyan,
                        ),
                      ),
                      value: sessionController.isRunning.value,
                      activeColor: Colors.orange, // Color when the switch is on
                      inactiveThumbColor: Colors.cyan, // Color when the switch is off
                      onChanged: (bool value) {
                        if (value) {
                          sessionController.startTimer();
                        } else {
                          sessionController.stopTimer();
                        }
                      },
                    );
                  }),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                    child: Container(
                      height: screenHeight * 0.15, // Responsive container height
                      decoration: BoxDecoration(
                        color: o,
                        borderRadius: BorderRadius.circular(screenWidth * 0.03), // Responsive border radius
                        border: Border.all(
                          color: Colors.black,
                          width: screenWidth * 0.005, // Responsive border width
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                        child: Text(
                          'La technique Pomodoro est une méthode de gestion du temps '
                              'traditionnellement de 25 minutes, séparée par de courtes pauses. '
                              'Cette technique aide à améliorer la concentration et la productivité.',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
