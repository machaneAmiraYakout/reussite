import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color sideColor;
  final Color primary;
  final Color onPrimary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 20.0,
    required this.sideColor,
    required this.primary,
    required this.onPrimary,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: SizedBox(
        // Responsively set button height and width
        height: screenHeight * 0.07, // 7% of screen height
        width: screenWidth * 0.5, // 50% of screen width
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: onPrimary,
            backgroundColor: primary,
            elevation: 5,
            shadowColor: Colors.cyanAccent,
            side: BorderSide(color: sideColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.055, // 4% of the screen width
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
