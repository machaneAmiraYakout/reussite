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
              return buildHomeScreenContent(userDetailsController); // Build the main content when data is ready
            }
          },
        ),
      ),
    );
  }

  Widget buildHomeScreenContent(UserDetailsController userDetailsController) {
    final specialite = userDetailsController.specialite.value;

    return Column(
      children: [
        const SizedBox(height: 70,),
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
                const SizedBox(width: 10),
                const Text(
                  'Les Spécialités Disponibles :',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const SizedBox(height: 20), // Adjust space between rows as needed
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
