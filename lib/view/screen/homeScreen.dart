import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/phrScreen.dart';
import '../../presenter/controllers/UserDetailsController.dart';
import '../widget/card.dart';
import '../widget/colors.dart';
import 'chrScreen.dart';
import 'medScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get the instance of UserDetailsController
    final UserDetailsController userDetailsController = Get.find<UserDetailsController>();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: userDetailsController.fetchUserSpecialite(), // Fetch specialite when entering the screen
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Show a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data: ${snapshot.error}')); // Handle errors
            } else {
              return buildHomeScreenContent(context, userDetailsController); // Pass context to the method
            }
          },
        ),
      ),
    );
  }
  Widget buildHomeScreenContent(BuildContext context, UserDetailsController userDetailsController) {
    final specialite = userDetailsController.specialite.value;

    return Column(
      children: [
        SizedBox(height: 70),
        Container(
          height: 90,
          width: double.infinity,
          color: o,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/logo.png', // Replace with your image asset
                  height: 100,
                ),
                SizedBox(width: 10),
                Text(
                  'Les Spécialités Disponibles :',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.059, // 4% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSpecialtyCard(
                      'Médecine',
                      'assets/heart.png',  // Replace with your image asset
                      k,
                      120,
                          () {
                        if (specialite == 'Médecine') {
                          Get.to(() => const MedScreen());
                        } else {
                          userDetailsController.showAccessDeniedDialogS();
                        }
                      },
                    ),
                    buildSpecialtyCard(
                      'ChirDent',
                      'assets/dent.png',  // Replace with your image asset
                      o,
                      100,
                          () {
                        if (specialite == 'ChirDent') {
                          Get.to(() => const ChrScreen());
                        } else {
                          userDetailsController.showAccessDeniedDialogS();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust space between rows as needed
                Center(
                  child: buildSpecialtyCard(
                    'Pharmacie',
                    'assets/medc.png',  // Replace with your image asset
                    vr,
                    90,
                        () {
                      if (specialite == 'Pharmacie') {
                        Get.to(() => const PhrScreen());
                      } else {
                        userDetailsController.showAccessDeniedDialogS();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
