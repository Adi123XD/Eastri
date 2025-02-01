import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
    required this.textColor,
    this.height = 50,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
