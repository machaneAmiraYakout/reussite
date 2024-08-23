import 'jsonQuest.dart';

class ModuleJson {
  final String module;
  final String year;
  final List<QuestionJson> questions;

  ModuleJson({required this.module, required this.year, required this.questions});
}