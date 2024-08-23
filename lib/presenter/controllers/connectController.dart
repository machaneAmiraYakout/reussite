import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/screen/bottomNavigationBarScreen.dart';
import '../../view/screen/connectScreen.dart';
class ConnectController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var name = ''.obs;
  var phone = ''.obs;
  Future<void> connect() async {
    if (phone.value.isNotEmpty && name.value.isNotEmpty) {
      try {
        var querySnapshot = await _firestore
            .collection('users')
            .where('phone', isEqualTo: phone.value)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;

          if (userDoc['approved'] == true) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('name', name.value);
            await prefs.setString('phone', phone.value);
            await prefs.setBool('approved', true);

            Get.off(() => NavigationScreen());
          } else {
            Get.snackbar(
              'Erreur',
              'Vous n\'êtes pas approuvé pour entrer.',
              backgroundColor: Colors.green,
            );
          }
        } else {
          await _firestore.collection('users').add({
            'name': name.value,
            'phone': phone.value,
            'approved': false,
          });

          Get.snackbar(
            'Inscription',
            'Vous avez été enregistré avec succès. Attendez l\'approbation de l\'administrateur.',
            backgroundColor: Colors.blue,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Une erreur s\'est produite: $e',
          backgroundColor: Colors.red,
        );
      }
    } else {
      Get.snackbar(
        'Erreur',
        'Veuillez entrer votre nom et numéro de téléphone.',
        backgroundColor: Colors.red,
      );
    }
  }
// Fetch user data based on phone number from Firestore
  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedPhone = prefs.getString('phone') ?? '';

    if (storedPhone.isNotEmpty) {
      try {
        var querySnapshot = await _firestore
            .collection('users')
            .where('phone', isEqualTo: storedPhone)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          name.value = userDoc['name'];
        } else {
          print('No user found with this phone number.');
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('Phone number is not stored.');
    }
  }
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('approved') ?? false;
  }


  // Method to handle logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all preferences, or use prefs.remove(key) for specific keys

    Get.off(() => ConnecteScreen()); // Navigate to ConnecteScreen after logout
  }
}
