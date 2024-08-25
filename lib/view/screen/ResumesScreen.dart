import 'package:flutter/material.dart';

class ResumesScreen extends StatelessWidget {
  final List<String> resumes;

  const ResumesScreen({super.key, required this.resumes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumes'),
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