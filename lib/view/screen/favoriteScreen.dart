import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/favoriteController.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          'Favorite Questions',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: favoriteController.favoriteQuestions.length,
          itemBuilder: (context, index) {
            final question = favoriteController.favoriteQuestions[index];

            return Dismissible(
              key: Key(question.questionText),
              onDismissed: (direction) {
                // Remove item from favorites
                favoriteController.toggleFavorite(question);
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete, color: Colors.white, size: 40),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
              ),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Colors.cyan.shade100, // Change card color to cyan
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.questionText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      for (var option in question.options)
                        Row(
                          children: [
                            Icon(
                              question.correctOptions.contains(option)
                                  ? Icons.check
                                  : Icons.radio_button_unchecked,
                              color: question.correctOptions.contains(option)
                                  ? Colors.green
                                  : Colors.black,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(option,
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
