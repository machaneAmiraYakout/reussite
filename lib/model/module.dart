import 'package:get/get.dart';

class ModuleData {
  final String name;
  final List<String> qcms;
  final List<String> resumes;
  final List<String> autres;
  RxString imagePath; // Make it reactive
  final Map<String, List<String>> coursesByYear; // Map to hold PDFs by year

  ModuleData(
      this.name,
      this.qcms,
      this.resumes,
      this.autres, {
        String? imagePath,
        Map<String, List<String>>? coursesByYear, // Accept map for courses by year
      })  : imagePath = imagePath?.obs ?? ''.obs,
        coursesByYear = coursesByYear ?? {}; // Initialize to empty map if null
}
