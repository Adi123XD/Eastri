import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isEnabled;
  final String buttonName;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool borderSideEnabled;
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.isEnabled,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      required this.borderSideEnabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: isEnabled
              ? AppColors.primaryColor
              : backgroundColor ?? AppColors.darkGrey,
          side: borderSideEnabled
              ? BorderSide(color: Colors.black)
              : BorderSide(color: Colors.transparent)),
      onPressed: onPressed,
      child: Text(buttonName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: textColor ?? Colors.white)),
    );
  }
}
