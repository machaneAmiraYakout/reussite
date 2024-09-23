import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/favoriteQuest.dart';
import '../../presenter/controllers/favoriteController.dart';
import '../../presenter/controllers/noteController.dart';
import '../../presenter/controllers/qcmController.dart';
import '../widget/colors.dart';
class QcmMedScreen extends StatefulWidget {
  final String yearM;
  final String nameM;

  const QcmMedScreen({super.key, required this.yearM, required this.nameM});
  @override
  _QcmScreenState createState() => _QcmScreenState();
}
class _QcmScreenState extends State<QcmMedScreen> {
  late final QuestionController controller;
  late final NoteController noteController;
  late final TextEditingController noteTextController;
  late final FavoriteController favoriteController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(QuestionController()); // Initialize the QuestionController
    noteController = Get.put(NoteController()); // Initialize the NoteController
    noteTextController = TextEditingController(); // Initialize TextEditingController
    favoriteController = Get.put(FavoriteController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 3.0,
            shape: const CircleBorder(),
            child: IconButton(
              icon: const Icon(Icons.lightbulb, color: Colors.orange, size: 24),
              onPressed: () {}, // Add action for lightbulb icon here
              splashRadius: 24,
              padding: const EdgeInsets.all(8),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 30), // Adjust logo size as needed
            const SizedBox(width: 8),
            const Text(
              'éussite',
              style: TextStyle(
                fontSize: 20, // Adjust text size as needed
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.forum_rounded, color: pricipalColor, size: 30),
              onPressed: () {}, // Add action for forum icon here
              splashRadius: 24,
              padding: const EdgeInsets.all(8),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.questions.isEmpty) {
                    return const Center(child: Text('Loading questions...'));
                  }
                  return Column(
                    children: [
                      // Displaying the question text
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: controller.parseOptionWithSuperscript(
                                controller.currentQuestion.question), // Parse question with superscript/subscript
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Display the photo if it exists
                      if (controller.currentQuestion.photo != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              // Show the dialog with a larger image when the photo is tapped
                              Get.dialog(
                                Dialog(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.asset(
                                      controller.currentQuestion.photo!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 120, // Set the desired width for the small image
                              height: 120, // Set the desired height for the small image
                              child: Image.asset(
                                controller.currentQuestion.photo!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                      // Dynamic SizedBox height based on photo existence
                      SizedBox(height: controller.currentQuestion.photo != null ? 5 : 50),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //fav button
                            ElevatedButton(
                              onPressed: () {
                                // Ensure that correctOptions is correctly populated
                                final correctOptions = controller.currentQuestion.correctAnswers;
                                final currentFavoriteQuestion = FavoriteQuestion(
                                  questionText: controller.currentQuestion.question ?? '',
                                  options: controller.currentQuestion.options ?? [],
                                  correctOptions: correctOptions,
                                  photo: controller.currentQuestion.photo,
                                  nameModule:widget.nameM,
                                );

                                favoriteController.toggleFavorite(currentFavoriteQuestion);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade100, // Background color
                                shape: const CircleBorder(), // Circular shape
                                padding: EdgeInsets.zero, // Remove default padding
                                elevation: 2.0, // Same elevation as Material
                              ),
                              child: Obx(() {
                                final correctOptions = controller.currentQuestion.correctAnswers;

                                final currentFavoriteQuestion = FavoriteQuestion(
                                  questionText: controller.currentQuestion.question ?? '',
                                  options: controller.currentQuestion.options ?? [],
                                  correctOptions: correctOptions,
                                  photo: controller.currentQuestion.photo,
                                  nameModule: widget.nameM,
                                );
                                bool isFavorite = favoriteController.isFavorite(currentFavoriteQuestion);
                                return Icon(
                                  Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.white, // Change color based on favorite status
                                  size: 20,
                                );
                              }),
                            ),



                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                controller.verifyAnswer(); // Verify the selected answer
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                shadowColor: Colors.grey,
                                elevation: 5,
                              ),
                              child: const Text(
                                'Vérifier',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Note button
                            ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Add a Note",
                                  backgroundColor: Colors.white,
                                  titleStyle: const TextStyle(color: Colors.black, fontSize: 18),
                                  radius: 10,
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: TextEditingController(
                                          text: noteController.notes['${widget.yearM}_${controller.currentQuestionIndex.value}'] ?? '',
                                        ),
                                        onChanged: (value) {
                                          noteController.notes['${widget.yearM}_${controller.currentQuestionIndex.value}'] = value;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Write your note here...",
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              noteController.saveNote(
                                                widget.yearM,
                                                controller.currentQuestionIndex.value,
                                                noteController.notes['${widget.yearM}_${controller.currentQuestionIndex.value}'] ?? '',
                                              ); // Save the note
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.orange,
                                            ),
                                            child: const Text("Save"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              noteController.deleteNote(
                                                widget.yearM,
                                                controller.currentQuestionIndex.value,
                                              ); // Delete the note
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Obx(() {
                                        String currentNote = noteController.notes['${widget.yearM}_${controller.currentQuestionIndex.value}'] ?? '';
                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            currentNote.isEmpty ? "No notes saved yet" : currentNote,
                                            style: const TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                                elevation: 2.0,
                              ),
                              child: const Icon(Icons.description, color: Colors.white, size: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Flexible(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          children: controller.currentQuestion.options.map((option) {
                            bool isSelected = controller.selectedAnswers[controller.currentQuestionIndex.value].contains(option);
                            bool isCorrect = controller.currentQuestion.correctAnswers.contains(option);
                            bool isAnswerChecked = controller.showResults[controller.currentQuestionIndex.value];

                            // Determine the color based on answer status
                            Color getColor() {
                              if (isAnswerChecked) {
                                if (isSelected && isCorrect) return Colors.green;
                                if (isSelected && !isCorrect) return Colors.red;
                                if (isCorrect) return Colors.green;
                              }
                              return isSelected ? Colors.blue : Colors.white;
                            }

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: getColor(), // Apply the determined color
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.cyan,
                                  child: Text(
                                    String.fromCharCode(65 + controller.currentQuestion.options.indexOf(option)),
                                    style: const TextStyle(color: Colors.white), // Icon color A, B, C, etc.
                                  ),
                                ),
                                title: RichText(
                                  text: TextSpan(
                                    children: controller.parseOptionWithSuperscript(option), // Parse option with superscript/subscript
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                onTap: () {
                                  controller.selectAnswer(option); // Handle answer selection
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_circle_left, color: Colors.cyan, size: 40),
                              onPressed: () {
                                controller.updateQuestionIndex(
                                    (controller.currentQuestionIndex.value - 1).clamp(0, controller.questions.length - 1));
                              }, // Navigate to the previous question
                              splashRadius: 30,
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(),
                              iconSize: 40,
                            ),
                            Column(
                              children: [
                                Slider(
                                  value: controller.currentQuestionIndex.value.toDouble(),
                                  min: 0,
                                  max: (controller.questions.length - 1).toDouble(),
                                  onChanged: (value) {
                                    controller.updateQuestionIndex(value.toInt()); // Update question index with slider
                                  },
                                  activeColor: pricipalColor,
                                  inactiveColor: o,
                                ),
                                Text(
                                  '${controller.currentQuestionIndex.value + 1}/${controller.questions.length}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_circle_right, color: Colors.cyan, size: 40),
                              onPressed: () {
                                controller.updateQuestionIndex(
                                    (controller.currentQuestionIndex.value + 1).clamp(0, controller.questions.length - 1));
                              }, // Navigate to the next question
                              splashRadius: 30,
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(),
                              iconSize: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}