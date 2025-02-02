import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressed: () => Navigator.of(context).pop()),
      body: _buildAuthText(context),
    );
  }

  Widget _buildAuthText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(AppStrings.letsJoinWithUs,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black)),
        Text(AppStrings.enterYourPhoneNumberAccountToGetStarted,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.darkGrey))
      ],
    );
  }

  
}
