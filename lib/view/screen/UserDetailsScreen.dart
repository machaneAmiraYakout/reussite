import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/UserDetailsController.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDetailsController controller = Get.put(UserDetailsController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Veuillez sélectionner vos informations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.cyan.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.cyan, width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Obx(() {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.specialite.value.isNotEmpty ? controller.specialite.value : null,
                          hint: Text('Sélectionnez une spécialité'),
                          items: controller.specialiteAnnees.keys.map((specialite) {
                            return DropdownMenuItem<String>(
                              value: specialite,
                              child: Text(specialite),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.updateSpecialite(value ?? '');
                          },
                          style: TextStyle(color: Colors.black),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.cyan),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.cyan, width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Obx(() {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.annee.value.isNotEmpty ? controller.annee.value : null,
                          hint: Text('Sélectionnez une année'),
                          items: controller.anneesList.map((annee) {
                            return DropdownMenuItem<String>(
                              value: annee,
                              child: Text(annee),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.updateAnnee(value ?? '');
                          },
                          style: TextStyle(color: Colors.black),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.cyan),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 32),
                  Obx(() {
                    return ElevatedButton(
                      onPressed: controller.isLoading.value ? null : () {

                        controller.updateUserDetails(
                          controller.annee.value,
                          controller.specialite.value,);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      )
                          : const Text(
                        'Enregistrer',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
