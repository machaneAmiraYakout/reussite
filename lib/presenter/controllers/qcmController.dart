
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
  var availableYears = <String>[].obs; // Make it observable

  late QuestionData currentQuestion;
  @override
  void onInit() {
    super.onInit();
    // Initialize selectedAnswers with empty lists
    selectedAnswers.assignAll(List.generate(questions.length, (_) => []));
  }
  Future<void> loadAvailableYears(String selectedYear, String selectedSem, String selectedMod) async {
    try {
      availableYears.clear();

      // Step 1: Load Anatomie JSON to find the module
      final String anatomieJsonString = await rootBundle.loadString('assets/resources/annee1S1/Chirdent.json');
      final Map<String, dynamic> anatomieData = json.decode(anatomieJsonString);

      if (anatomieData['years'] is! List) {
        throw Exception('Invalid format: years section is missing or not a list.');
      }

      final List<dynamic> yearsData = anatomieData['years'];
      bool moduleFound = false;

      for (var yearData in yearsData) {
        if (yearData['annee']?.trim() == selectedYear.trim()) {
          for (var semester in yearData['semesters'] ?? []) {
            if (semester['semestre']?.trim() == selectedSem.trim()) {
              final modules = semester['modules'];
              if (modules is List) {
                for (var module in modules) {
                  if (module['module']?.trim() == selectedMod.trim()) {
                    moduleFound = true;

                    // Step 2: Get the module link
                    final String? moduleLink = module['link'];
                    if (moduleLink == null) {
                      throw Exception('Module link not found.');
                    }

                    // Step 3: Load the module JSON (e.g., francais.json)
                    final String moduleJsonString = await rootBundle.loadString(moduleLink);
                    final List<dynamic> moduleData = json.decode(moduleJsonString);

                    // Step 4: Extract the year from the module JSON
                    for (var moduleYearData in moduleData) {
                      if (moduleYearData is Map<String, dynamic> && moduleYearData['year'] != null) {
                        availableYears.add(moduleYearData['year']);
                      }
                    }

                    print("Available Years: $availableYears");

                    if (availableYears.isEmpty) {
                      print('No available years found in module: $selectedMod');
                    }

                    break;
                  }
                }
              }
            }
          }
        }
      }

      if (!moduleFound) {
        throw Exception('Module not found.');
      }

    } catch (e) {
      Get.snackbar("Error", "Failed to load available years: $e");
      print("Error loading available years: $e");
    }
  }
  Future<void> loadQuestionsForYear(String selectedYear, String selectedSem, String selectedMod, String year) async {
    try {
      // Step 1: Load Anatomie JSON to find the module's JSON file path
      final String anatomieJsonString = await rootBundle.loadString('assets/resources/annee1S1/Chirdent.json');
      final Map<String, dynamic> anatomieData = json.decode(anatomieJsonString);

      final List<dynamic> yearsData = anatomieData['years'];
      String moduleJsonPath = '';

      for (var yearData in yearsData) {
        if (yearData['annee']?.trim() == selectedYear.trim()) {
          for (var semester in yearData['semesters'] ?? []) {
            if (semester['semestre']?.trim() == selectedSem.trim()) {
              for (var module in semester['modules'] ?? []) {
                if (module['module']?.trim() == selectedMod.trim()) {
                  moduleJsonPath = module['link'];
                  break;
                }
              }
              if (moduleJsonPath.isNotEmpty) break;
            }
            if (moduleJsonPath.isNotEmpty) break;
          }
          if (moduleJsonPath.isNotEmpty) break;
        }
      }

      if (moduleJsonPath.isEmpty) {
        throw Exception('Module JSON path not found.');
      }

      // Step 2: Load the module JSON file
      final String moduleJsonString = await rootBundle.loadString(moduleJsonPath);
      final List<dynamic> moduleData = json.decode(moduleJsonString);

      // Step 3: Clear previous data
      questions.clear();
      selectedAnswers.clear();
      showResults.clear();

      // Step 4: Extract questions for the selected year
      for (var moduleYearData in moduleData) {
        if (moduleYearData is! Map<String, dynamic>) {
          throw Exception('Invalid format: moduleYearData is not a Map.');
        }
        if (moduleYearData['year']?.trim() == year.trim()) {
          for (var questionData in moduleYearData['questions'] ?? []) {
            if (questionData is! Map<String, dynamic>) {
              throw Exception('Invalid format: questionData is not a Map.');
            }
            questions.add(QuestionData.fromJson(questionData));
            selectedAnswers.add([]);
            showResults.add(false);
          }
          break; // Exit loop once the correct year is found
        }
      }

      if (questions.isNotEmpty) {
        currentQuestionIndex.value = 0;
        currentQuestion = questions[0];  // Initialize with the first question
      }
    } catch (e) {
      print("Error in loadQuestionsForYear: $e"); // Added for debugging
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


