import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchAnneeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var annee = ''.obs;

  @override
  void onInit() {
  super.onInit();
  // Initialize the anneesList based on the default or first specialite
  fetchUserAnnee();  // Fetch annee when the controller is initialized


}
  Future<void> fetchUserAnnee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone') ?? '';

    if (phone.isNotEmpty) {
      try {
        var querySnapshot = await _firestore
            .collection('users')
            .where('phone', isEqualTo: phone)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          annee.value = querySnapshot.docs.first['annee'] ?? '';
          print('Fetched annee: ${annee.value}'); // Debug statement
        }
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Erreur lors de la récupération de l\'année: $e',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        );
      }
    }
  }
  void showAccessDeniedDialogA() {
    Get.dialog(
      AlertDialog(
        title: const Text('Accès refusé'),
        content: const Text('Vous ne pouvez pas accéder à cette section car ce n\'est pas votre année.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK', style: TextStyle(color: Colors.cyan)),
          ),
        ],
      ),
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    );
  }

}