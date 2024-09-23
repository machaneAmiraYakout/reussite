import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/animationController.dart';
import '../widget/customButton.dart';
import 'connectScreen.dart';

class InitialScreen extends StatelessWidget {
  final MyAnimationController animationController = Get.put(MyAnimationController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                    Image.asset('assets/logo.png', width: screenWidth * 0.25, height: screenWidth * 0.25), // Responsive Logo
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
                    SizedBox(
                      width: screenWidth * 0.05, // Responsive spacing
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.57,
                  child: Stack(
                    children: [
                      // First container with staggered animation
                      Positioned(
                        top: screenHeight * 0.03, // Adjusted position so it's below the phone image
                        left: screenWidth * 0.40, // Adjusted to align properly
                        child: SlideTransition(
                          position: animationController.firstContainerAnimation,
                          child: buildAnimatedContainer(
                            screenWidth,
                            screenHeight,
                            color: const Color(0x400892d4),
                            text: 'Réussir vos études médicales Externat/Résidanat',
                          ),
                        ),
                      ),
                      // Second container with staggered animation
                      Positioned(
                        top: screenHeight * 0.16, // Spacing below the first container
                        left: screenWidth * 0.40, // Adjusted to align properly
                        child: SlideTransition(
                          position: animationController.secondContainerAnimation,
                          child: buildAnimatedContainer(
                            screenWidth,
                            screenHeight,
                            color: const Color(0x407e8fdb),
                            text: 'Qcms avec leurs corrigés type',
                          ),
                        ),
                      ),
                      // Third container with staggered animation
                      Positioned(
                        top: screenHeight * 0.26, // Spacing below the second container
                        left: screenWidth * 0.40, // Adjusted to align properly
                        child: SlideTransition(
                          position: animationController.thirdContainerAnimation,
                          child: buildAnimatedContainer(
                            screenWidth,
                            screenHeight,
                            color: const Color(0x4011cfe4),
                            text: 'Préparer bien vos examens',
                          ),
                        ),
                      ),
                      // Fourth container with staggered animation
                      Positioned(
                        top: screenHeight * 0.36, // Spacing below the third container
                        left: screenWidth * 0.40, // Adjusted to align properly
                        child: SlideTransition(
                          position: animationController.fourthContainerAnimation,
                          child: buildAnimatedContainer(
                            screenWidth,
                            screenHeight,
                            color: const Color(0x4Deea37f),
                            text: 'Résumés qui vous aident',
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.01,
                        right: screenWidth * 0.23,
                        child: Image.asset(
                          'assets/phone.png',
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.45,
                          fit: BoxFit.contain,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // Continue button and other UI
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
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Continuer',
                    onPressed: () {
                      Get.to(ConnecteScreen()); // Ensure this screen is properly imported
                    },
                    borderRadius: 20,
                    sideColor: const Color(0x207e8fdb),
                    primary: const Color(0xFF11cfe4),
                    onPrimary: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: 0.4,
                        heightFactor: 0.5,
                        child: Container(
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Helper to build animated container widgets
  Widget buildAnimatedContainer(double screenWidth, double screenHeight, {required Color color, required String text}) {
    return Container(
      width: screenWidth * 0.5,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color, // 30% opacity
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
            ),
          ),
          const Icon(Icons.check_circle_outline, color: Colors.black, size: 24),
        ],
      ),
    );
  }

  // Helper to build the circular decorations at the bottom
  Align _buildCircleDecoration(double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ClipRect(
        child: Align(
          alignment: Alignment.topRight,
          widthFactor: 0.4,
          heightFactor: 0.5,
          child: Container(
            width: screenWidth * 0.4, // Responsive width
            height: screenHeight * 0.4, // Responsive height
            decoration: const BoxDecoration(
              color: Color(0xFF11cfe4),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
