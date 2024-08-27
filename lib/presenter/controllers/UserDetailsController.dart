import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/screen/bottomNavigationBarScreen.dart';
class UserDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var specialite = ''.obs;
  var isLoading = false.obs;
  var annee = ''.obs;
  // Map of specialites to their corresponding years
  final Map<String, List<String>> specialiteAnnees = {
    'ChirDent': ['1 ÈRE ANNÉE', '2 ÈME ANNÉE','3 ÈME ANNÉE','4 ÈME ANNÉE','5 ÈME ANNÉE' ],
    'Médecine': ['1 ÈRE ANNÉE', '2 ÈME ANNÉE','3 ÈME ANNÉE','4 ÈME ANNÉE','5 ÈME ANNÉE', '6 ÈME ANNÉE'],
    'Pharmacie': ['1 ÈRE ANNÉE', '2 ÈME ANNÉE','3 ÈME ANNÉE','4 ÈME ANNÉE','5 ÈME ANNÉE' ],
  };
  // Observable for the list of years based on selected specialite
  var anneesList = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    // Initialize the anneesList based on the default or first specialite
    updateAnneesList(specialiteAnnees.keys.first);
    fetchUserSpecialite();  // Fetch specialite when the controller is initialized


  }
  void updateSpecialite(String value) {
    specialite.value = value;
    updateAnneesList(value); // Update the annees list when specialite changes
  }
  void updateAnnee(String value) {
    annee.value = value;
  }
  void updateAnneesList(String specialite) {
    anneesList.value = specialiteAnnees[specialite] ?? [];
    // Clear the annee if it is not in the updated list
    if (!anneesList.contains(annee.value)) {
      annee.value = '';
    }
  }
  Future<void> updateUserDetails(String annee, String specialite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone') ?? '';

    if (phone.isNotEmpty) {
      try {
        var querySnapshot = await _firestore
            .collection('users')
            .where('phone', isEqualTo: phone)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first.id; // Get document ID

          // Update the user's document with annee and specialite
          await _firestore.collection('users').doc(userDoc).update({
            'annee': annee,
            'specialite': specialite,
          });

          // Navigate to the home screen after updating
          Get.off(() => NavigationScreen()); // Replace with your home screen
        }
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Une erreur s\'est produite lors de la mise à jour des détails : $e',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        );
      }
    }
  }
  Future<void> fetchUserSpecialite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone') ?? '';

    if (phone.isNotEmpty) {
      try {
        var querySnapshot = await _firestore
            .collection('users')
            .where('phone', isEqualTo: phone)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          specialite.value = querySnapshot.docs.first['specialite'];
        }
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Erreur lors de la récupération de la spécialité: $e',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        );
      }
    }
  }
  void showAccessDeniedDialogS() {
    Get.dialog(
      AlertDialog(
        title: const Text('Accès refusé'),
        content: const Text('Vous ne pouvez pas accéder à cette section car ce n\'est pas votre spécialité.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK',style: TextStyle(color: Colors.cyan),),
          ),
        ],
      ),
    );
  }
}
