//hadi l ui li nkhyr mnha les modules
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/semestre.dart';
import '../../presenter/controllers/moduleController.dart';
import '../widget/colors.dart';
import 'moduleDetails.dart';
class ModuleSelectionScreen extends StatelessWidget {

  final SemesterData semester;
  final String year;

  ModuleSelectionScreen({required this.semester, required this.year,});

  @override
  Widget build(BuildContext context) {
    final ModuleController modController = Get.find();


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
              child: Stack(
                clipBehavior: Clip.none, // This ensures the overflowing children are not clipped
                children: [
                  Container(
                    height: 100,
                    width: 320,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child:  Center(
                        child: Container(
                          width: 200, // Adjust the width to fit your design
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(year+semester.name,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, // Limit to 2 lines
                            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                            textAlign: TextAlign.center, // Align the text in the center
                          ),
                        )


                    ),
                  ),
                  Positioned(
                    left: -30, // Adjust this value to position the injection icon
                    bottom: -30, // Adjust this value to position the injection icon
                    child: Image.asset(
                      'assets/dnt.png', // Path to injection icon asset
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Positioned(
                    right: -20, // Adjust this value to position the stethoscope icon
                    top: -20, // Adjust this value to position the stethoscope icon
                    child: Image.asset(
                      'assets/mth.png', // Path to stethoscope icon asset
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 50),
            const Text('Les Modules :',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 30),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10), // Add padding around the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between items
                  childAspectRatio: 4, // Aspect ratio of each grid item (width/height)
                ),
                itemCount: semester.modules.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Store the selected module in the controller
                      modController.selectedMod(semester.modules[index]);
                      // Navigate to the module details screen
                      Get.to(() => ModuleDetailsScreen(module: semester.modules[index]));

                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: o, // Background color of each grid item
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                      child: Text(
                        semester.modules[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}