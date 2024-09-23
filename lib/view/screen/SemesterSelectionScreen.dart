import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/year.dart';
import '../../presenter/controllers/quoteController.dart';
import '../../presenter/controllers/semestreController.dart';
import '../widget/colors.dart';
import 'ModuleSelectionScreen.dart';

class SemesterSelectionScreen extends StatelessWidget {
  final YearData year; // Received from ChrScreen
  final String listName;
  const SemesterSelectionScreen({super.key, required this.year, required this.listName});

  @override
  Widget build(BuildContext context) {
    final QuoteController controller = Get.put(QuoteController());
    final SemestreController semController = Get.find();
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
            listName == 'years' ? Center(
              child: Stack(
                clipBehavior: Clip.none, // This ensures the overflowing children are not clipped
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Center(
                      child: Container(
                        width: 200, // Adjust the width to fit your design
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '${year.name}CHIRDENT',
                          style:  TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06, // Responsive font size based on screen width
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2, // Limit to 2 lines
                          overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                          textAlign: TextAlign.center, // Align the text in the center
                        ),
                      ),
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
            ):Center(
              child: Stack(
                clipBehavior: Clip
                    .none, // This ensures the overflowing children are not clipped
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: k,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: const Center(
                      child: Text(
                        'MÉDECINE',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left:
                    -80, // Adjust this value to position the injection icon
                    bottom:
                    -90, // Adjust this value to position the injection icon
                    child: Image.asset(
                      'assets/inj.png', // Path to injection icon asset
                      width: 220,
                      height: 220,
                    ),
                  ),
                  Positioned(
                    right:
                    -40, // Adjust this value to position the stethoscope icon
                    top:
                    -40, // Adjust this value to position the stethoscope icon
                    child: Image.asset(
                      'assets/sth.png', // Path to stethoscope icon asset
                      width: 130,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Call the changeQuote method to update the quote
                  controller.changeQuote();
                },
                child: Container(
                  height: 150,
                  width: 300,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color:listName == 'years' ? k : o,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Obx(
                          () => Text(
                        controller.quotes[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.048, // Error here
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: year.semesters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Store the selected semester in the controller
                      semController.selectedSem(year.semesters[index]);
                      // Navigate to the module selection screen
                      Get.to(() => ModuleSelectionScreen(semester: year.semesters[index], year: year.name, listName: listName,));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 90.0),
                      height: 60,
                      decoration: BoxDecoration(
                        color:listName == 'years' ? o : k, // 'o' for years, 'k' for others
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          year.semesters[index].name,
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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