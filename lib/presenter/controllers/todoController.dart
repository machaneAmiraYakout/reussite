import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/todo.dart'; // For JSON encoding/decoding

class ToDoController extends GetxController {
  var toDoLists = <String, RxList<ToDoItem>>{}; // Map to hold lists for each day
  late RxList<ToDoItem> currentDayList;
  late String currentDay; // Add this field to keep track of the current day

  final TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize with empty lists for each day
    toDoLists['Monday'] = <ToDoItem>[].obs;
    toDoLists['Tuesday'] = <ToDoItem>[].obs;
    // Add entries for other days

    loadToDoLists(); // Load saved to-do lists
  }

  void setDay(String day) {
    currentDay = day; // Set the current day
    currentDayList = toDoLists[day] ?? <ToDoItem>[].obs;
  }

  void addToDo() {
    final task = controller.text.trim();
    if (task.isNotEmpty) {
      currentDayList.add(ToDoItem(task: task, isCompleted: false));
      saveToDoList();
      controller.clear();
    }
  }

  void toggleToDoCompletion(int index) {
    final item = currentDayList[index];
    item.isCompleted = !item.isCompleted;
    currentDayList[index] = item;
    saveToDoList();
  }

  void saveToDoList() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = currentDayList.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(currentDay, todoList);
  }

  void loadToDoLists() async {
    final prefs = await SharedPreferences.getInstance();
    for (var day in toDoLists.keys) {
      final todoList = prefs.getStringList(day) ?? [];
      toDoLists[day]!.assignAll(todoList.map((item) => ToDoItem.fromJson(jsonDecode(item))).toList());
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

