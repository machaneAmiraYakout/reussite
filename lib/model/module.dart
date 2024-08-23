import 'package:get/get.dart';

class ModuleData {
  final String name;
  final List<String> courses;
  final List<String> qcms;
  final List<String> resumes;
  final List<String> autres;
  RxString imagePath; // Make it reactive

  ModuleData(
      this.name,
      this.courses,
      this.qcms,
      this.resumes,
      this.autres, {
        String? imagePath,
      }) : imagePath = imagePath?.obs ?? ''.obs;
}