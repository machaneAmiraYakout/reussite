import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  final List<String> autres;

  OtherScreen({required this.autres});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autres'),
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