import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/animationController.dart';
import '../widget/customButton.dart';
import 'connectScreen.dart';
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  @override
  State<InitialScreen> createState() => _HomeState();
}
class _HomeState extends State<InitialScreen> {
  final MyAnimationController animationController = Get.put(MyAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top section with logo and text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/logo.png', width: 100, height: 100), // Logo
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 80),
                        Text(
                          'ÉUSSITE',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'QCMS',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'vous allez réussir',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 21,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 450, // Container width
                  height: 400, // Container height
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40, // Adjust top position
                        left: 177, // Adjust left position
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0x400892d4), // 30% opacity
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0x400892d4), width: 2),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Réussir vos études médicales Externat/Résidanat',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.check_circle_outline, color: Colors.black, size: 24),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 135, // Adjust top position
                        left: 177, // Adjust left position
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0x407e8fdb) , // 30% opacity
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0x407e8fdb), width: 2),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Qcms avec leurs corrigés type',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.check_circle_outline, color: Colors.black, size: 24),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210, // Adjust top position
                        left: 177, // Adjust left position
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0x4011cfe4), // 30% opacity
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0x2011cfe4), width: 2),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Préparer bien vos examens',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.check_circle_outline, color: Colors.black, size: 24),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 285, // Adjust top position
                        left: 177, // Adjust left position
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0x4Deea37f), // 30% opacity
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0x4Deea37f), width: 2),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Résumés qui vous aident',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.check_circle_outline, color: Colors.black, size: 24),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 120,
                        child: Image.asset(
                          'assets/phone.png',
                          width: 355, // Increased width
                          height: 355, // Increased height
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topRight,
                        widthFactor: 0.4,
                        heightFactor: 0.5,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4), // 50% opacity for #184784 color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text:'Continuer',
                    onPressed:(){
                      Get.to( ConnecteScreen());

                    } ,
                    borderRadius:20 ,
                    sideColor: const Color(0x207e8fdb) ,
                    primary: const Color(0xFF11cfe4) ,
                    onPrimary:Colors.white ,


                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: 0.4,
                        heightFactor: 0.5,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4), // 50% opacity for #184784 color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}