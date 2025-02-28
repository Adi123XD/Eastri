import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/appColors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.globalButton,
        minimumSize: Size(buttonWidth, 41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: () {
        Get.offNamed('/checkoutScreen');
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
      ),
    );
  }
}
