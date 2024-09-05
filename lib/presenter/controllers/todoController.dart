import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../model/todo.dart'; // For JSON encoding/decoding

class ToDoController extends GetxController {
  var toDoLists = <String, RxList<ToDoItem>>{}; // Map to hold lists for each day
  late RxList<ToDoItem> currentDayList;
  late String currentDay; // Field to track the current day

  final TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Initialize empty lists for each day
    toDoLists['Monday'] = <ToDoItem>[].obs;
    toDoLists['Tuesday'] = <ToDoItem>[].obs;
    toDoLists['Wednesday'] = <ToDoItem>[].obs;
    toDoLists['Thursday'] = <ToDoItem>[].obs;
    toDoLists['Friday'] = <ToDoItem>[].obs;
    toDoLists['Saturday'] = <ToDoItem>[].obs;
    toDoLists['Sunday'] = <ToDoItem>[].obs;

    loadToDoLists(); // Load saved to-do lists on initialization
  }

  void setDay(String day) {
    currentDay = day;
    currentDayList = toDoLists[day] ?? <ToDoItem>[].obs;
    // Reload the current day's list in case it was saved previously
    loadToDoListForDay(day);
  }

  void addToDo() {
    final task = controller.text.trim();
    if (task.isNotEmpty) {
      currentDayList.add(ToDoItem(task: task, isCompleted: false));
      saveToDoList(); // Save the updated list for the current day
      controller.clear();
    }
  }

  void toggleToDoCompletion(int index) {
    final item = currentDayList[index];
    item.isCompleted = !item.isCompleted;
    currentDayList[index] = item;
    saveToDoList(); // Save updated list when completion status changes
  }

  void saveToDoList() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = currentDayList.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(currentDay, todoList); // Save list for the current day
  }

  void loadToDoLists() async {
    final prefs = await SharedPreferences.getInstance();
    for (var day in toDoLists.keys) {
      final todoList = prefs.getStringList(day) ?? [];
      toDoLists[day]!.assignAll(todoList.map((item) => ToDoItem.fromJson(jsonDecode(item))).toList());
    }
  }

  // Load the to-do list specifically for the current day
  void loadToDoListForDay(String day) async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = prefs.getStringList(day) ?? [];
    currentDayList.assignAll(todoList.map((item) => ToDoItem.fromJson(jsonDecode(item))).toList());
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}


