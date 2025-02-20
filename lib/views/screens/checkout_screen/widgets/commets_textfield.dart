import 'package:flutter/material.dart';
import '../../../../res/appColors/app_colors.dart';

class CommetsTextfield extends StatelessWidget {
  const CommetsTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Add comments',
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.globalButton),
        filled: true,
        fillColor: Color(0xFFCAE3ED),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
