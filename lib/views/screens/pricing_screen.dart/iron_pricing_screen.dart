import 'package:flutter/material.dart';

import 'kids_pricing_screen.dart';
import 'mens_pricing_screen.dart';
import 'widgets/custom_row_tab.dart';
import 'womens_pricing_screen.dart';

class IronPricingScreen extends StatelessWidget {
  const IronPricingScreen({super.key});

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
