import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/sessionController.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the session controller
    final sessionController = Get.find<SessionController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Spent in App'),
      ),
      body: Center(
        child: Obx(() {
          // Calculate time spent in the app
          final timeSpent = DateTime.now().difference(sessionController.sessionStartTime);
          final hours = timeSpent.inHours;
          final minutes = timeSpent.inMinutes % 60;
          final seconds = timeSpent.inSeconds % 60;

          return Text(
            'Time Spent: ${hours.toString().padLeft(2, '0')}:'
                '${minutes.toString().padLeft(2, '0')}:'
                '${seconds.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          );
        }),
      ),
    );
  }
}
