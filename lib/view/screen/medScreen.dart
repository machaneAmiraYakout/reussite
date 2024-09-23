import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/dataChirdent.dart';
import '../../data/dataMedecine.dart';
import '../../presenter/controllers/fetchAnneController.dart';
import '../../presenter/controllers/yearController.dart';
import '../widget/colors.dart';
import 'SemesterSelectionScreen.dart';

class MedScreen extends StatefulWidget {
  const MedScreen({super.key});

  @override
  State<MedScreen> createState() => _ChrScreenState();
}

class _ChrScreenState extends State<MedScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){Get.back();},
                    icon:  const Icon(Icons.arrow_circle_left,
                      color:pricipalColor,// Use light mode color
                      size: 40,)),
                Image.asset('assets/logo.png', width: 60, height: 60), // Logo
              ],),
            const SizedBox(height: 10),
            Center(
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
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: yearsMed.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // Get the selected year from the list
                      final selectedYear = yearsMed[index];

                      // Set the selected year in the controller
                      // yearsController.setSelectedYear(selectedYear);

                      // Fetch the annee value
                      final fetchedAnnee = fetchAnneeController.annee.value.trim();
                      print('Selected Year: ${selectedYear.name.trim()}');
                      print('Fetched Annee: ${fetchedAnnee}');
                      // Compare the selected year with the fetched annee
                      if (selectedYear.name.trim() == fetchedAnnee) {
                        // Navigate to the semester selection screen
                        Get.to(SemesterSelectionScreen(year: selectedYear,listName:'yearsMed'));
                      } else {
                        // Show dialog if the year does not match
                        fetchAnneeController.showAccessDeniedDialogA();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 70.0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: k, // Use the desired color
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          yearsMed[index].name,
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