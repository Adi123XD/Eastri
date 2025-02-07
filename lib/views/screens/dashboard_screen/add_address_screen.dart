import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/address_container.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/saved_address_container.dart';
import 'package:eastri_customer_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:eastri_customer_app/widgets/greeting_section.dart';
import 'package:eastri_customer_app/widgets/translate_contianer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            GreetingSection(
              icon: Icons.arrow_back,
              onIconPressed: () {
                Get.offNamed('/dashboardScreen');
              },
            ),
            TranslateContianer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressContainer(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFB2AEAE),
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'SAVED ADDRESSES',
                        style: TextStyle(
                          color: Color(0xFF2C6A89),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFB2AEAE),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SavedAddressContainer(
                    title: 'Home',
                    address:
                        'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk, New Delhi',
                    endIcon: Icons.home_outlined,
                  ),
                  const SizedBox(height: 10),
                  SavedAddressContainer(
                    title: 'Home',
                    address:
                        'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk, New Delhi',
                    endIcon: Icons.home_outlined,
                  ),
                  const SizedBox(height: 10),
                  SavedAddressContainer(
                    title: 'Home',
                    address:
                        'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk, New Delhi',
                    endIcon: Icons.home_outlined,
                  ),
                  const SizedBox(height: 10),
                  SavedAddressContainer(
                    title: 'Home',
                    address:
                        'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk, New Delhi',
                    endIcon: Icons.home_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
