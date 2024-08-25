import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  final List<String> autres;

  const OtherScreen({super.key, required this.autres});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autres'),
      ),
      body: ListView.builder(
        itemCount: autres.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(autres[index]),
          );
        },
      ),
    );
  }
}