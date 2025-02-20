import 'package:flutter/material.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_item_card.dart';

class WomensPricingScreen extends StatefulWidget {
  const WomensPricingScreen({super.key});

  @override
  State<WomensPricingScreen> createState() => _WomensPricingScreenState();
}

class _WomensPricingScreenState extends State<WomensPricingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/Dress.png',
              title: 'Dress',
              price: '70',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/tshirtF.png',
              title: 'T-Shrit',
              price: '30',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/jeans.png',
              title: 'Jeans',
              price: '50',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/jacket.png',
              title: 'Jacket',
              price: '65',
              onAdd: () {},
            ),
            SizedBox(height: 25),
            CustomButton(
              text: 'Continue',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
