import 'package:eastri_customer_app/views/screens/pricing_screen.dart/kids_pricing_screen.dart';
import 'package:eastri_customer_app/views/screens/pricing_screen.dart/womens_pricing_screen.dart';
import 'package:flutter/material.dart';
import 'mens_pricing_screen.dart';
import 'widgets/custom_row_tab.dart';

class SteamIronPricingScreen extends StatelessWidget {
  const SteamIronPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomRowTab(
          pages: [
            MensPricingScreen(),
            WomensPricingScreen(),
            KidsPricingScreen(),
          ],
        ),
      ),
    );
  }
}
