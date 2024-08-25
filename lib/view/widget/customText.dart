import 'package:flutter/material.dart';
class MyCustomText extends StatelessWidget {
  final int index;
  final String text;
  //final Color? color;
  final TextAlign alignment;
  const MyCustomText({super.key, 
    required this.index,
    required this.text,
    // this.color = primaryColor,
    this.alignment = TextAlign.center,
  });
  double getResponsiveFontSize(BuildContext context, double referenceSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const referenceWidth = 375; // Reference width for font size calculations (you can adjust it based on your design)
    // Calculate the ratio of the screen's width to the reference width
    final widthRatio = screenWidth / referenceWidth;
    // Calculate the responsive font size
    final fontSize = referenceSize * widthRatio;

    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (index) {
      case 1: // Head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 21),
          fontWeight: FontWeight.w700,
          // color: settingscontroller.isDarkMode.value
          //     ? Colors.white// Use dark mode color
          //     : primaryColor, // Use light mode color
          letterSpacing: 2,
        );
        break;
      case 2://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 15),
          fontWeight: FontWeight.w400,
          // color: settingscontroller.isDarkMode.value
          //     ? Colors.white// Use dark mode color
          //     : subTitleTextColor, // Use light mode color
        );
        break;
      default:
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 12),
          fontWeight: FontWeight.w400,
        );
    }

    return  Text(
      text,
      style: textStyle,
    );
  }
}