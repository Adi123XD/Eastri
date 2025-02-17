import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/views/screens/wallet_screen/widgets/add_money_container.dart';
import 'package:eastri_customer_app/views/screens/wallet_screen/widgets/gift_card_container.dart';
import 'package:eastri_customer_app/views/widgets/gardient_container.dart';
import 'package:eastri_customer_app/views/widgets/translate_contianer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen1 extends StatelessWidget {
  const WalletScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            GradientContainer(
              height: 211,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          Get.offNamed('/dashboardScreen');
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'WALLET',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.walletText,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Seamless access to your finances',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.walletText,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            TranslateContianer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddMoneyContainer(),
                  SizedBox(height: 30),
                  GiftCardContainer(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Transaction History',
                          style: TextStyle(
                            color: AppColors.globalButton,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
