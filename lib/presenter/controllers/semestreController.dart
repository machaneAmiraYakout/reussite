import 'package:get/get.dart';

import '../../model/semestre.dart';

class SemestreController extends GetxController {
  // Observable variable to hold the selected year
  var selectedSem = Rx<SemesterData?>(null);

  // Method to set the selected year
  void setSelectedSem(SemesterData semestre) {
    selectedSem.value = semestre;
  }

  // Method to get the selected year
  SemesterData? getSelectedSem() {
    return selectedSem.value;
  }
}