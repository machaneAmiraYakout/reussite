import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/todoController.dart';
import '../widget/colors.dart'; // Make sure to import your custom colors if needed

class ToDoScreen extends StatelessWidget {
  final String day; // Add a day parameter

  // Constructor that requires the 'day' parameter
  ToDoScreen({required this.day});

  final ToDoController toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    toDoController.setDay(day); // Set the current day's list

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: Colors.cyan, // Use appropriate color for light mode
            size: 40,
          ),
        ),
        title: Text(
          'To-Do List for $day', // Use the day parameter in the title
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: toDoController.currentDayList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = toDoController.currentDayList[index];

                    return Dismissible(
                      key: Key(item.task),
                      onDismissed: (direction) {
                        toDoController.currentDayList.removeAt(index);
                        toDoController.saveToDoList();
                      },
                      background: Container(
                        color: Colors.red,
                        child:
                            Icon(Icons.delete, color: Colors.white, size: 40),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 40),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: item.isCompleted
                              ? Colors.red.shade100
                              : Colors.cyan.shade50,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.task,
                            style: TextStyle(
                              decoration: item.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            item.isCompleted
                                ? Icons.check
                                : Icons.radio_button_unchecked,
                            color:
                                item.isCompleted ? Colors.green : Colors.black,
                          ),
                          onTap: () =>
                              toDoController.toggleToDoCompletion(index),
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: toDoController
                    .controller, // Use the controller from ToDoController
                decoration: InputDecoration(
                  labelText: 'Add a new task',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: toDoController.addToDo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
