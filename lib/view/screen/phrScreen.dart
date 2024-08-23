import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/colors.dart';

class PhrScreen extends StatefulWidget {
  const PhrScreen({Key? key}) : super(key: key);

  @override
  State<PhrScreen> createState() => _PhrScreenState();
}

class _PhrScreenState extends State<PhrScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                  const SizedBox(height: 20),
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
                            color: vr,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: const Center(
                            child: Text(
                              'PHARMACIE',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:
                          -110, // Adjust this value to position the injection icon
                          bottom:
                          -120, // Adjust this value to position the injection icon
                          child: Image.asset(
                            'assets/m.png', // Path to injection icon asset
                            width: 250,
                            height: 250,
                          ),
                        ),
                        Positioned(
                          right:
                          -70, // Adjust this value to position the stethoscope icon
                          top:
                          -70, // Adjust this value to position the stethoscope icon
                          child: Image.asset(
                            'assets/p.png', // Path to stethoscope icon asset
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
                          color: vr,
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
                  const SizedBox(height: 15),
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
                          color: vr,
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
                  const SizedBox(height: 15),
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
                          color: vr,
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
                  const SizedBox(height: 15,),
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
                          color: vr,
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
                  const SizedBox(height: 15,),
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
                          color: vr,
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
                ],
              ),
            ),
          )),
    );
  }
}