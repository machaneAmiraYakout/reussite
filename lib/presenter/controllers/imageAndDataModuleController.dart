
import 'package:get/get.dart';
import '../../model/module.dart';
class ImageAndDataController extends GetxController {
  var years = <String>[].obs;

  final ModuleData module;

  ImageAndDataController(this.module);

  @override
  void onInit() {
    super.onInit();
  }

  // Access image path as a reactive variable
  RxString get imagePath => module.imagePath;
  void updateImagePath(String newPath) {
    module.imagePath.value = newPath;
    print("Image Path Updated: ${module.imagePath.value}");  // Debugging statement
  }
}