
import 'package:get/get.dart';
import '../../model/module.dart';
class ImageAndDataController extends GetxController {
  final ModuleData module;
  ImageAndDataController(this.module);


  // Access image path as a reactive variable
  RxString get imagePath => module.imagePath;
  void updateImagePath(String newPath) {
    module.imagePath.value = newPath;
    print("Image Path Updated: ${module.imagePath.value}");  // Debugging statement
  }
}