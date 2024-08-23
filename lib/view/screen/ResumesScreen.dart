import 'package:flutter/material.dart';

class ResumesScreen extends StatelessWidget {
  final List<String> resumes;

  ResumesScreen({required this.resumes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumes'),
      ),
      body: ListView.builder(
        itemCount: resumes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resumes[index]),
          );
        },
      ),
    );
  }
}