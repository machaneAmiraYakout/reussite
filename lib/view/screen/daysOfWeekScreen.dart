import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/toDoScreen.dart';

class DaysOfWeekScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> days = [
      'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          'Select a Day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in grid
            crossAxisSpacing: 16.0, // Horizontal spacing between items
            mainAxisSpacing: 16.0, // Vertical spacing between items
          ),
          itemCount: days.length,
          itemBuilder: (context, index) {
            final day = days[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => ToDoScreen(day: day));
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.cyan,
                      size: 20, // Adjust the size of the icon
                    ),
                    SizedBox(width: 8), // Spacing between icon and text
                    Expanded(
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        maxLines: 1, // Ensure text stays on one line
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
