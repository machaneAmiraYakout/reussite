// lib/comparison_utils.dart
import 'model/jsonModule.dart';
import 'model/jsonQuest.dart';
import 'model/jsonSemestre.dart';
import 'model/jsonYear.dart';
import 'model/module.dart';
import 'model/question.dart';
import 'model/semestre.dart';
import 'model/year.dart';
bool compareYear(YearJson yearJson, YearData yearData) {
  if (yearJson.annee != yearData.name) {
    return false;
  }

  if (yearJson.semesters.length != yearData.semesters.length) {
    return false;
  }

  for (int i = 0; i < yearJson.semesters.length; i++) {
    if (!compareSemester(yearJson.semesters[i], yearData.semesters[i])) {
      return false;
    }
  }

  return true;
}

bool compareSemester(SemesterJson semesterJson, SemesterData semesterData) {
  if (semesterJson.semestre != semesterData.name) {
    return false;
  }

  if (semesterJson.modules.length != semesterData.modules.length) {
    return false;
  }

  for (int i = 0; i < semesterJson.modules.length; i++) {
    if (!compareModule(semesterJson.modules[i], semesterData.modules[i])) {
      return false;
    }
  }

  return true;
}

bool compareModule(ModuleJson moduleJson, ModuleData moduleData) {
  return moduleJson.module == moduleData.name;
}

bool compareQuestion(QuestionJson questionJson, QuestionData questionData) {
  if (questionJson.question != questionData.question) {
    return false;
  }

  if (!listEquals(questionJson.options, questionData.options)) {
    return false;
  }

  if (!listEquals(questionJson.correctAnswers, questionData.correctAnswers)) {
    return false;
  }

  return true;
}

bool listEquals<T>(List<T> list1, List<T> list2) {
  if (list1.length != list2.length) return false;
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) return false;
  }
  return true;
}