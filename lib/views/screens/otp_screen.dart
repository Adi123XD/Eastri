import 'dart:async';

import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:eastri_customer_app/utils/sizeConfig/app_sizeconfig.dart';
import 'package:eastri_customer_app/views/widgets/custom_appbar.dart';
import 'package:eastri_customer_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/appStrings/app_strings.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isFormValided = false;
  final validPin = "1234";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  // Timer variables
  Timer? _timer;
  int _remainingSeconds = 60;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black), // Black border
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Starts a timer that counts down every second
  void _startTimer() {
    _remainingSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  // Helper to format time as MM:SS
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildOtpText(context),
            SizedBox(height: AppSizeconfig.screenHeight * 0.04),
            _buildOTPTextField(context),
            SizedBox(height: AppSizeconfig.screenHeight * 0.04),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                _formatTime(_remainingSeconds),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                isEnabled: isFormValided,
                buttonName: AppStrings.continueText,
                onPressed: isFormValided
                    ? () {
                        Get.toNamed(AppRoutes.otpScreen);
                      }
                    : () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOtpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.enterYourOtpCode,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black),
          ),
          Text(
            "${AppStrings.enterYourA4DigitCode} +91 8928597720.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPTextField(BuildContext context) {
    return Form(
      key: _formKey,
      child: Pinput(
        length: 4,
        keyboardType: TextInputType.number,
        controller: _otpController,
        animationCurve: Curves.bounceIn,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        cursor: Container(
          width: 2,
          height: 24,
          color: Colors.black,
        ),
        errorBuilder: (errorText, pin) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                errorText ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.red),
              ),
            ),
          );
        },
        onChanged: (value) {},
        onCompleted: (value) {
          print("Success: $value");
        },
        validator: (value) {
          return value == validPin ? null : AppStrings.pinIsIncorrect;
        },
      ),
    );
  }
}
