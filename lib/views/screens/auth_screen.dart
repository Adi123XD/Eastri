import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/utils/sizeConfig/app_sizeconfig.dart';
import 'package:eastri_customer_app/views/widgets/custom_button.dart';
import 'package:eastri_customer_app/views/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isFormValided = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      isFormValided = _formKey.currentState?.validate() ?? false;
      if (nameController.text.isEmpty || phoneController.text.isEmpty) {
        isFormValided = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(key: _formKey, child: _buildAuthText(context)),
      ),
    );
  }

  Widget _buildAuthText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppStrings.letsJoinWithUs,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black)),
          Text(AppStrings.enterYourAccountDetailsToGetStarted,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.darkGrey)),
          SizedBox(height: AppSizeconfig.screenHeight * 0.02),
          _buildNameField(context),
          SizedBox(height: AppSizeconfig.screenHeight * 0.02),
          _buildPhoneInput(context),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
                isEnabled: isFormValided,
                buttonName: AppStrings.continueText,
                onPressed: isFormValided
                    ? () {
                        Get.toNamed(AppRoutes.otpScreen);
                      }
                    : () {}),
          )
        ],
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black),
        ),
        SizedBox(height: 8),
        CustomTextfield(
          controller: nameController,
          hintText: AppStrings.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.nameIsRequired;
            }
            return null;
          },
          onChanged: (value) {
            _validateForm();
          },
        )
      ],
    );
  }

  Widget _buildPhoneInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.phoneNumber,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: AppSizeconfig.screenWidth,
          child: IntlPhoneField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            dropdownIcon: Icon(Icons.arrow_drop_down_rounded),
            pickerDialogStyle: PickerDialogStyle(
                backgroundColor: AppColors.darkGrey,
                searchFieldCursorColor: AppColors.primaryColor),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            dropdownTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintText: AppStrings.numberHint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkGrey)),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              _validateForm();
            },
            validator: (value) {
              if (value == null) {
                return AppStrings.phoneNumberIsRequired;
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
