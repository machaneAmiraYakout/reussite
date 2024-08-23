import 'jsonModule.dart';

class SemesterJson {
  final String semestre;
  final List<ModuleJson> modules;

  SemesterJson({required this.semestre, required this.modules});
}