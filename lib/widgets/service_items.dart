import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final Function onTap;
  final double imageHeight;
  final double imageWidth;

  const ServiceItem({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.imageHeight,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 88,
        width: 131,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              imagePath,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
