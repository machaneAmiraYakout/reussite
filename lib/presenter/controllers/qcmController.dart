
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../model/question.dart';
class QuestionController extends GetxController {
  var questions = <QuestionData>[].obs;
  var currentQuestionIndex = 0.obs;
  var selectedAnswers = <List<String>>[].obs; // List of lists to store selected answers for each question
  var showResults = <bool>[].obs; // List to track whether to show results for each question
  var availableYears = <String>[].obs; // List to store available years
  late QuestionData currentQuestion;
  @override
  void onInit() {
    super.onInit();
    // Initialize selectedAnswers with empty lists
    selectedAnswers.assignAll(List.generate(questions.length, (_) => []));
  }
  Future<void> loadAvailableYears(String selectedYear, String selectedSem, String selectedMod) async {
    try {
      // Clear the list before loading new data to prevent duplication
      availableYears.clear();

      final String jsonString = await rootBundle.loadString('assets/resources/annee1S1/Anatomie.json');
      final Map<String, dynamic> data = json.decode(jsonString);
      final List<dynamic> yearsData = data['years'];

      for (var yearData in yearsData) {
        if (yearData['annee'].trim() == selectedYear.trim()) {
          for (var semester in yearData['semesters']) {
            if (semester['semestre'].trim() == selectedSem.trim()) {
              for (var module in semester['modules']) {
                if (module['module'].trim() == selectedMod.trim()) {
                  availableYears.add(module['year']); // Add the available year to the list
                }
              }
            }
          }
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load available years: $e");
    }
  }
  Future<void> loadQuestionsForYear(String selectedYear, String selectedSem, String selectedMod, String year) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/resources/annee1S1/Anatomie.json');
      final Map<String, dynamic> data = json.decode(jsonString);
      final List<dynamic> yearsData = data['years'];

      for (var yearData in yearsData) {
        if (yearData['annee'].trim() == selectedYear.trim()) {
          for (var semester in yearData['semesters']) {
            if (semester['semestre'].trim() == selectedSem.trim()) {
              for (var module in semester['modules']) {
                if (module['module'].trim() == selectedMod.trim() && module['year'].trim() == year.trim()) {
                  questions.clear(); // Clear any previous questions
                  selectedAnswers.clear(); // Clear previous selected answers
                  showResults.clear(); // Clear previous results

                  for (var questionData in module['questions']) {
                    questions.add(QuestionData.fromJson(questionData));
                    selectedAnswers.add([]); // Initialize with empty lists
                    showResults.add(false);  // Initialize show results to false
                  }
                }
              }
            }
          }
        }
      }

      if (questions.isNotEmpty) {
        currentQuestionIndex.value = 0;
        currentQuestion = questions[0];  // Initialize with the first question
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load questions: $e");
    }
  }
  void selectAnswer(String answer) {
    List<String> currentSelected = selectedAnswers[currentQuestionIndex.value];

    if (currentSelected.contains(answer)) {
      currentSelected.remove(answer);
    } else {
      currentSelected.add(answer);
    }

    selectedAnswers[currentQuestionIndex.value] = List.from(currentSelected);
  }
  void verifyAnswer() {
    showResults[currentQuestionIndex.value] = true;
  }
  void updateQuestionIndex(int index) {
    currentQuestionIndex.value = index;
    currentQuestion = questions[index];
  }
  // Function to parse option and return RichText spans
  List<InlineSpan> parseOptionWithSuperscript(String option) {
    List<InlineSpan> spans = [];

    final RegExp regExp = RegExp(r'(\^|_)([a-zA-Z0-9±*/,.°\+\-]+)');

    option.splitMapJoin(regExp, onMatch: (match) {
      if (match.group(1) == '^') {
        // Superscript handling
        spans.add(WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0, -6), // Superscript offset
            child: Text(match.group(2)!, style: const TextStyle(fontSize: 12.0)),
          ),
        ));
      } else if (match.group(1) == '_') {
        // Subscript handling
        spans.add(WidgetSpan(
          child: Transform.translate(
            offset: const Offset(0, 6), // Subscript offset
            child: Text(match.group(2)!, style: const TextStyle(fontSize: 12.0)),
          ),
        ));
      }
      return '';
    }, onNonMatch: (nonMatch) {
      spans.add(TextSpan(text: nonMatch, style: const TextStyle(fontSize: 16.0)));
      return '';
    });

    return spans;
  }
}