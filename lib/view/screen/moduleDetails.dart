import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/yearSelectionMedScreen.dart';
import '../../comparaison.dart';
import '../../model/jsonModule.dart';
import '../../model/jsonSemestre.dart';
import '../../model/jsonYear.dart';
import '../../model/module.dart';
import '../../presenter/controllers/imageAndDataModuleController.dart';
import '../../presenter/controllers/selectionContoller.dart';
import '../../presenter/controllers/yearController.dart';
import '../widget/colors.dart';
import '../widget/customdetailsbutton.dart';
import 'ResumesScreen.dart';
import 'coursesScreen.dart';
import 'otherScreen.dart';
import 'yearSelectionScreen.dart';


class ModuleDetailsScreen extends StatelessWidget {
  final ModuleData module;
  final String listName;

  ModuleDetailsScreen({super.key, required this.module, required this.listName,}) {
    // Create or find an instance of ModuleController for this module
    if (Get.isRegistered<ImageAndDataController>(tag: module.name)) {
      Get.delete<ImageAndDataController>(tag: module.name); // Ensure old instance is deleted
    }
    Get.put(ImageAndDataController(module), tag: module.name);
  }

  @override
  Widget build(BuildContext context) {
    // Get instances of the controllers
    final YearsController yearsController = Get.find();
    final controller = Get.find<SelectionController>();

    // Retrieve the stored data
    final selectedYear = yearsController.getSelectedYear();
    final ImageAndDataController controller1 = Get.find<ImageAndDataController>(tag: module.name);


    // Perform comparison
    bool isMatch = false;
    YearJson? matchingYearJson; // Load or retrieve YearJson list as appropriate
    SemesterJson? matchingSemesterJson;
    ModuleJson? matchingModuleJson;

    // Load or retrieve YearJson list as appropriate
    List<YearJson> yearJsonList = []; // Populate with your JSON data
    for (var yearJson in yearJsonList) {
      if (compareYear(yearJson, controller.selectedYear.value!)) {
        matchingYearJson = yearJson;
        break;
      }
    }

    if (matchingYearJson != null) {
      for (var semesterJson in matchingYearJson.semesters) {
        if (compareSemester(semesterJson, controller.selectedSemester.value!)) {
          matchingSemesterJson = semesterJson;
          break;
        }
      }
    }

    if (matchingSemesterJson != null) {
      for (var moduleJson in matchingSemesterJson.modules) {
        if (compareModule(moduleJson, controller.selectedModule.value!)) {
          matchingModuleJson = moduleJson;
          isMatch = true;
          break;
        }
      }
    }


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      color: pricipalColor, // Use light mode color
                      size: 40,
                    ),
                  ),
                  Image.asset('assets/logo.png', width: 60, height: 60), // Logo
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 150,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: listName == 'years' ?o:k,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Center align items
                  children: [
                    const SizedBox(width: 20,),
                    Text(
                      module.name,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Obx(() {
                      return controller1.imagePath.isNotEmpty
                          ? Image.asset(
                        controller1.imagePath.value,
                        height: 150,
                        width: 150,
                      )
                          : const SizedBox(); // Handle case when there's no image
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'LES CATÉGORIES :',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
              textAlign: TextAlign.center, // Align the text in the center
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomDetailsButton(
                  text: 'COURS',
                  icon: Icons.book,
                  color: pricipalColor,
                  onPressed: () {
                    Get.to(CoursesScreen(coursesByYear: module.coursesByYear));
                  },
                ),
                CustomDetailsButton(
                  text: 'RÉSUMÉS',
                  icon: Icons.description,
                  color: Colors.redAccent,
                  onPressed: () {
                    Get.to(ResumesScreen(resumes: module.resumes));
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomDetailsButton(
                  text: 'QCMS',
                  icon: Icons.question_answer,
                  color: Colors.orangeAccent,
                  onPressed: () {
                    if(listName=='years') {
                      Get.to(YearSelectionScreen(module: module,));
                      print('jjrrrrrrrrrrrrrrrrrrrrrrrrrrrrrjjjjjjjjjjjjjjjjjjjjj$selectedYear');
                    } else{
                      Get.to(YearSelectionMedScreen(module: module,));
                      print('medmedmemdmedmemdmemdmemmdmemdmemdmedmjjjjjjjjjjjjjjjjjjjjj$selectedYear');

                    }
                  },
                ),
                CustomDetailsButton(
                  text: 'AUTRES',
                  icon: Icons.more_horiz,
                  color: rs,
                  onPressed: () {
                    Get.to(OtherScreen(autres: module.autres));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}