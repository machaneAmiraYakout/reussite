import 'package:get/get.dart';
import '../../model/module.dart';
import '../../model/semestre.dart';
import '../../model/year.dart';


class SelectionController extends GetxController {
  Rx<YearData?> selectedYear = Rx<YearData?>(null);
  Rx<SemesterData?> selectedSemester = Rx<SemesterData?>(null);
  Rx<ModuleData?> selectedModule = Rx<ModuleData?>(null);
}