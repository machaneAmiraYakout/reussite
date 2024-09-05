import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/qcmScreen.dart';
import '../../model/module.dart';
import '../../presenter/controllers/imageAndDataModuleController.dart';
import '../../presenter/controllers/moduleController.dart';
import '../../presenter/controllers/qcmController.dart';
import '../../presenter/controllers/semestreController.dart';
import '../../presenter/controllers/yearController.dart';
import '../widget/colors.dart';

class YearSelectionScreen extends StatelessWidget {
  final ModuleData module;

  YearSelectionScreen({super.key, required this.module}) {
    if (Get.isRegistered<ImageAndDataController>(tag: module.name)) {
      Get.delete<ImageAndDataController>(tag: module.name);
    }
    Get.put(ImageAndDataController(module), tag: module.name);
  }

  @override
  Widget build(BuildContext context) {
    final ImageAndDataController controller = Get.find<ImageAndDataController>(tag: module.name);
    final QuestionController cont = Get.put(QuestionController());

    // Get instances of the other controllers
    final YearsController yearsController = Get.find();
    final SemestreController semController = Get.find();
    final ModuleController modController = Get.find();

    // Retrieve the selected data
    final selectedYear = yearsController.getSelectedYear();
    final selectedSem = semController.getSelectedSem();
    final selectedMod = modController.getSelectedMod();

    // Load available years based on the selected year, semester, and module
    cont.loadAvailableYears(
      selectedYear!.name,
      selectedSem!.name,
      selectedMod!.name,
    );

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
                      color: pricipalColor,
                      size: 40,
                    ),
                  ),
                  Image.asset('assets/logo.png', width: 60, height: 60),
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
                  color: o,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      return controller.imagePath.isNotEmpty
                          ? Image.asset(
                        controller.imagePath.value,
                        height: 150,
                        width: 150,
                      )
                          : const SizedBox();
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Obx(() {
                if (cont.availableYears.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Increase the number of columns for smaller width items
                    crossAxisSpacing: 10.0, // Adjust horizontal spacing between grid items
                    mainAxisSpacing: 10.0, // Vertical spacing between grid items
                    childAspectRatio: 3.0, // Adjust aspect ratio to make items smaller in width
                  ),
                  itemCount: cont.availableYears.length,
                  itemBuilder: (context, index) {
                    final year = cont.availableYears[index];

                    return GestureDetector(
                      onTap: () async {
                        // Load questions for the selected year, semester, module, and year
                        await cont.loadQuestionsForYear(
                          selectedYear.name,
                          selectedSem.name,
                          selectedMod.name,
                          year,
                        );

                        // Navigate to QcmScreen with the selected year
                        Get.to(() => QcmScreen(year: year,name:module.name));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: o,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            year,  // Display the year string
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}