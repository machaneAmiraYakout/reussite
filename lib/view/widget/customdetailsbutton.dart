import 'package:flutter/material.dart';

class CustomDetailsButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomDetailsButton({super.key, 
    required this.text,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170, // Adjust the width as needed
      height: 80, // Adjust the height as needed
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white,size: 30),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}