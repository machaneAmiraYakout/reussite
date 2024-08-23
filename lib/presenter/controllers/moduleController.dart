
import 'package:get/get.dart';
import '../../model/module.dart';

class ModuleController extends GetxController {
  var selectedMod = Rx<ModuleData?>(null);

// Method to set the selected year
  void setSelectedMod(ModuleData module) {
    selectedMod.value = module;
  }

// Method to get the selected year
  ModuleData? getSelectedMod() {
    return selectedMod.value;
  }
}