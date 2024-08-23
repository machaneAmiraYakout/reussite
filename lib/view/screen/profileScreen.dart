import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/connectController.dart';
import '../widget/colors.dart';
import 'favoriteScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ConnectController connectController = Get.find<ConnectController>();
  @override
  void initState() {
    super.initState();

    // Fetch the user data from Firestore based on the stored phone number
    connectController.fetchUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          color: o,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Welcome back,',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Obx(() => Text(
                                  connectController.name.value.isNotEmpty
                                      ? connectController.name.value
                                      : 'NOM PRÉNOM!',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ],
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: pricipalColor,
                              child: Icon(Icons.perm_identity, size: 40, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    // Handle the Timing container tap
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'TIMING',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: pricipalColor,
                          child: Icon(Icons.access_time, size: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the Favorite container tap
                    Get.to(const FavoriteScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'FAVORITE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: pricipalColor,
                          child: Icon(Icons.favorite, size: 40, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle the To Do List container tap
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'TO DO LIST',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: pricipalColor,
                          child: Icon(Icons.checklist, size: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    connectController.logout(); // Call the logout method
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: o,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'LOG OUT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: pricipalColor,
                          child: Icon(Icons.logout, size: 40, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
