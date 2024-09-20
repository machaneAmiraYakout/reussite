import 'package:get/get.dart';

class ModuleData {
  final String name;
  final List<String> qcms;
  final List<String> resumes;
  final List<String> autres;
  RxString imagePath; // Make it reactive
  final List<String> coursespdfs; // Add PDFs field

  ModuleData(
      this.name,
      this.qcms,
      this.resumes,
      this.autres, {
        String? imagePath,
        this.coursespdfs = const [], // Initialize empty list for PDFs by default
      }) : imagePath = imagePath?.obs ?? ''.obs;
}
