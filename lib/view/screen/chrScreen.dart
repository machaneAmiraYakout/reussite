import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/dataChirdent.dart';
import '../../presenter/controllers/fetchAnneController.dart';
import '../../presenter/controllers/yearController.dart';
import '../widget/colors.dart';
import 'SemesterSelectionScreen.dart';

class ChrScreen extends StatefulWidget {
  const ChrScreen({super.key});

  @override
  State<ChrScreen> createState() => _ChrScreenState();
}

class _ChrScreenState extends State<ChrScreen> {
  final FetchAnneeController fetchAnneeController = Get.find<FetchAnneeController>();

  @override
  void initState() {
    super.initState();
    fetchAnneeController.fetchUserAnnee(); // Fetch the annee when initializing
  }

  @override
  Widget build(BuildContext context) {
    final YearsController yearsController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 300,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: const Center(
                      child: Text(
                        'CHIRDENT',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
            ),
            const SizedBox(
                height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: years.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // Get the selected year from the list
                      final selectedYear = years[index];

                      // Set the selected year in the controller
                      yearsController.setSelectedYear(selectedYear);

                      // Fetch the annee value
                      final fetchedAnnee = fetchAnneeController.annee.value.trim();
                      print('Selected Year: ${selectedYear.name.trim()}');
                      print('Fetched Annee: ${fetchedAnnee}');
                      // Compare the selected year with the fetched annee
                      if (selectedYear.name.trim() == fetchedAnnee) {
                        // Navigate to the semester selection screen
                        Get.to(SemesterSelectionScreen(year: selectedYear));
                      } else {
                        // Show dialog if the year does not match
                        fetchAnneeController.showAccessDeniedDialogA();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 70.0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: o, // Use the desired color
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          years[index].name,
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
            )
          ],
        ),
      ),
    );
  }
}