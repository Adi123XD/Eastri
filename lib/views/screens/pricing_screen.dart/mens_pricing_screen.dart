import 'package:eastri_customer_app/views/screens/pricing_screen.dart/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_item_card.dart';

class MensPricingScreen extends StatefulWidget {
  const MensPricingScreen({super.key});

  @override
  State<MensPricingScreen> createState() => _MensPricingScreenState();
}

class _MensPricingScreenState extends State<MensPricingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/Tshirt.png',
              title: 'T-Shirt',
              price: '50',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/sweater.png',
              title: 'Sweater',
              price: '65',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/shirt.png',
              title: 'Shirt',
              price: '80',
              onAdd: () {},
            ),
            SizedBox(height: 7),
            CustomItemCard(
              imagePath: 'assets/images/pricingScreen/trousers.png',
              title: 'Trousers',
              price: '50',
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
