import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/favoriteQuest.dart';
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
            color: Colors.cyan,
            size: 40,
          ),
        ),
        title: const Text(
          'Favorite Questions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        // Group the questions by module name
        Map<String, List<FavoriteQuestion>> groupedQuestions = {};
        for (var question in favoriteController.favoriteQuestions) {
          if (!groupedQuestions.containsKey(question.nameModule)) {
            groupedQuestions[question.nameModule] = [];
          }
          groupedQuestions[question.nameModule]!.add(question);
        }

        return ListView(
          children: groupedQuestions.entries.map((entry) {
            final moduleName = entry.key;
            final questions = entry.value;
            bool isExpanded = false; // Track whether the card is expanded

            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    // The button with the module name

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8), // Adjust vertical padding as needed
                      child:  ElevatedButton(
                        onPressed: () {
                          // Toggle the expanded state when clicked
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan.shade100,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          minimumSize: const Size(300, 50), // Full width button
                        ),
                        child: Text(
                          '$moduleName',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),

                    // Expand all questions under this module when button is clicked
                    if (isExpanded)
                      Column(
                        children: questions.map((question) {
                          return Dismissible(
                            key: Key(question.questionText),
                            onDismissed: (direction) {
                              // Remove item from favorites
                              favoriteController.toggleFavorite(question);
                            },
                            background: Container(
                              color: Colors.red,
                              child: const Icon(Icons.delete, color: Colors.white, size: 40),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 20),
                            ),
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              color: Colors.cyan.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      question.questionText,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(height: 10),
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
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(option,
                                                style: const TextStyle(color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                );
              },
            );
          }).toList(),
        );
      }),
    );
  }
}
