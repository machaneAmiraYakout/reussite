import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  final List<String> courses;

  CoursesScreen({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index]),
          );
        },
      ),
    );
  }
}