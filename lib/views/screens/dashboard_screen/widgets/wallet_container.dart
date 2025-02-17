import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletContainer extends StatelessWidget {
  const WalletContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.offNamed('/wallet1Screen');
      },
      child: Container(
        height: 101,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: AppColors.walletContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "WALLET",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Seamless access to your finances, just for you.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Image.asset(
              'assets/images/dashboard/wallet1.png',
              width: screenWidth * 0.18,
              height: screenWidth * 0.18,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
