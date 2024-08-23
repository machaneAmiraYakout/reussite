import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color sideColor;
  final Color primary;
  final Color onPrimary;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 20.0,
    required this.sideColor,
    required this.primary,
    required this.onPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: Container(
            height: screenHeight * 0.07,
            width: screenWidth *0.5,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: onPrimary, backgroundColor: primary, elevation: 5,
                shadowColor: Colors.cyanAccent, // set the text color to blue
                side:  BorderSide(color: sideColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),

              ),
              child: Text(
                text,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            )));
  }
}