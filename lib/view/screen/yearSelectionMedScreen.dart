import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/qcmScreen.dart';
import '../../model/module.dart';
import '../../presenter/controllers/imageAndDataModuleController.dart';
import '../../presenter/controllers/moduleController.dart';
import '../../presenter/controllers/qcmMedController.dart';
import '../../presenter/controllers/semestreController.dart';
import '../../presenter/controllers/yearController.dart';
import '../widget/colors.dart';

class YearSelectionMedScreen extends StatelessWidget {
  final ModuleData module;

  YearSelectionMedScreen({super.key, required this.module}) {
    if (Get.isRegistered<ImageAndDataController>(tag: module.name)) {
      Get.delete<ImageAndDataController>(tag: module.name);
    }
    Get.put(ImageAndDataController(module), tag: module.name);
  }

  @override
  Widget build(BuildContext context) {
    final ImageAndDataController controller = Get.find<ImageAndDataController>(tag: module.name);
    final QuestionMedController questionMedController = Get.put(QuestionMedController());

    final YearsController yearsController = Get.find();
    final SemestreController semController = Get.find();
    final ModuleController modController = Get.find();

    final selectedYear = yearsController.getSelectedYear();
    final selectedSem = semController.getSelectedSem();
    final selectedMod = modController.getSelectedMod();
    // Load available years based on the selected year, semester, and module
    questionMedController.loadAvailableMYears(
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
                    const SizedBox(width: 20),
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
                if (questionMedController.availableYears.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                print("Available Years in UI: ${questionMedController.availableYears}");
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 3.0,
                  ),
                  itemCount: questionMedController.availableYears.length,
                  itemBuilder: (context, index) {
                    final year = questionMedController.availableYears[index];
                    return GestureDetector(
                      onTap: () async {
                        await questionMedController.loadQuestionsMForYear(
                          selectedYear.name,
                          selectedSem.name,
                          selectedMod.name,
                          year,
                        );
                        Get.to(() => QcmScreen(year: year, name: module.name));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: o,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            year,
                            style:  TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04, // Error here
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
