import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final double fontSize;
  final double width;
  final double height;
  final Color borderColor;

  const MyButton({super.key, 
    required this.text,
    required this.onPressed,
    this.borderRadius = 16.0,
    this.fontSize = 20.0,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF9051),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor), // Add border color
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
