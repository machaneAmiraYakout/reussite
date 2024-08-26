import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/sessionController.dart';
import '../widget/colors.dart';

class TimerScreen extends StatelessWidget {
  final SessionController sessionController = Get.find<SessionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: Colors.cyan,
            size: 40,
          ),
        ),
        title: const Text(
          'Timer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: sessionController.isStudyPeriod.value
                          ? Colors.cyan
                          : Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade50,
                      borderRadius: BorderRadius.circular(20),
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
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Temps restant: $formattedTime',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 200,
                          height: 200,
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
                              strokeWidth: 100,
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
                  const SizedBox(height: 20),
                  Obx(() {
                    return SwitchListTile(
                      title: Text(
                        sessionController.isRunning.value ? 'Stop Timer' : 'Start Timer',
                        style: TextStyle(
                          fontSize: 18,
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: o,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'La technique Pomodoro est une méthode de gestion du temps '
                              'traditionnellement de 25 minutes, séparée par de courtes pauses. '
                              'Cette technique aide à améliorer la concentration et la productivité.',
                          style: TextStyle(
                            fontSize: 16,
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
