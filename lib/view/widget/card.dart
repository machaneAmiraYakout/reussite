import 'package:flutter/material.dart';

Widget buildSpecialtyCard(String title, String assetPath, Color color, double imageHeight, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 170,
      height: 180,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: imageHeight, // Adjust height as needed
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20, // Adjust font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}