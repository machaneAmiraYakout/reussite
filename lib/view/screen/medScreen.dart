import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../widget/colors.dart';
class MedScreen extends StatefulWidget {
  const MedScreen({Key? key}) : super(key: key);

  @override
  State<MedScreen> createState() => _MedScreenState();
}

class _MedScreenState extends State<MedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '1 ERE ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '2 EME ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '3 EME ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '4 EME ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '5 EME ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle the To Do List container tap
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: k,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:   const Center(
                          child: Text(
                            '6 EME ANNÉE',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}