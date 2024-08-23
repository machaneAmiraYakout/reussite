import 'package:get/get.dart';
import '../../model/year.dart';

class YearsController extends GetxController {
  // Observable variable to hold the selected year
  var selectedYear = Rx<YearData?>(null);

  // Method to set the selected year
  void setSelectedYear(YearData year) {
    selectedYear.value = year;
  }

  // Method to get the selected year
  YearData? getSelectedYear() {
    return selectedYear.value;
  }
}