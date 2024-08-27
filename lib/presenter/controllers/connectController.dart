import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/screen/UserDetailsScreen.dart';
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

        // Check if the phone number exists
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first.data(); // Use .data() to access document fields

          // Check if the name matches the one associated with the phone number
          if (userDoc['name'] == name.value) {
            if (userDoc['approved'] == true) {
              // Save user information to SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('name', name.value);
              await prefs.setString('phone', phone.value);
              await prefs.setBool('approved', true);

              // Navigate to the UserDetailsScreen if annee and specialite are not set
              String annee = userDoc['annee'] ?? ''; // Default to empty string if not present
              String specialite = userDoc['specialite'] ?? ''; // Default to empty string if not present

              if (annee.isNotEmpty && specialite.isNotEmpty) {
                // If both annee and specialite are set, navigate to the home screen
                Get.off(() => NavigationScreen()); // Replace with your home screen
              } else {
                // If annee or specialite are empty, navigate to the UserDetailsScreen
                Get.off(() => UserDetailsScreen());
              }
            } else {
              Get.snackbar(
                'Approbation !',
                'Vous n\'êtes pas approuvé pour entrer.',
                backgroundColor: Colors.cyanAccent,
                duration: Duration(seconds: 3),
              );
            }
          } else {
            Get.snackbar(
              'Erreur',
              'Le numéro de téléphone existe déjà.',
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            );
          }
        } else {
          // If phone number does not exist, create a new user
          await _firestore.collection('users').add({
            'name': name.value,
            'phone': phone.value,
            'approved': false,
          });

          Get.snackbar(
            'Inscription',
            'Vous avez été enregistré avec succès. Attendez l\'approbation de l\'administrateur.',
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          );
        }
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Une erreur s\'est produite: $e',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar(
        'Erreur',
        'Veuillez entrer votre nom et numéro de téléphone.',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
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

    Get.off(() =>  ConnecteScreen()); // Navigate to ConnecteScreen after logout
  }
}
