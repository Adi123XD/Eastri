import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double imageLeftPosition;
  final double imageTopPosition;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomTab({
    super.key,
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = const Color(0xFF2E6F90),
    this.unselectedColor = const Color(0xFFE2E2E2),
    required this.imageHeight,
    required this.imageTopPosition,
    required this.imageLeftPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 85,
            height: 75,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 85,
                  height: 67,
                  decoration: BoxDecoration(
                    color: isSelected ? selectedColor : unselectedColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  top: imageTopPosition,
                  left: imageLeftPosition,
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
