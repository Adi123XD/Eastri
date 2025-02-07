import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class TranslateContianer extends StatelessWidget {
  final Widget child;
  const TranslateContianer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Transform.translate(
        offset: const Offset(0, -20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.dashboardBg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 26.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
