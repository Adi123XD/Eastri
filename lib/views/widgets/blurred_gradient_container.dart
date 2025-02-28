import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredGradientContainer extends StatelessWidget {
  final Widget child;
  final double blurStrength;
  final double height;

  const BlurredGradientContainer({
    super.key,
    required this.child,
    this.blurStrength = 10.0,
    this.height = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color(0xFF307597),
                Color(0xFF102631),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
            child: Container(
              color: Colors.transparent, // Keep it transparent
            ),
          ),
        ),
        child,
      ],
    );
  }
}
