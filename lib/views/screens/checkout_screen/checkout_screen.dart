import 'package:eastri_customer_app/views/screens/checkout_screen/widgets/cart_total.dart';
import 'package:eastri_customer_app/views/screens/checkout_screen/widgets/commets_textfield.dart';
import 'package:eastri_customer_app/views/screens/pricing_screen.dart/widgets/custom_button.dart';
import 'package:eastri_customer_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/cart_item_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offNamed('/pricingTabScreen');
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Basket',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CartItemCard(
                  imagePath: 'assets/images/pricingScreen/Tshirt.png',
                  title: 'T-Shirt',
                  subtitle: 'Men',
                  price: 50.0,
                  onDecrease: () {},
                  onIncrease: () {},
                ),
                SizedBox(height: 25),
                CartItemCard(
                  imagePath: 'assets/images/pricingScreen/trousers.png',
                  title: 'T-Shirt',
                  subtitle: 'Women',
                  price: 30.0,
                  onDecrease: () {},
                  onIncrease: () {},
                ),
                SizedBox(height: 25),
                CartItemCard(
                  imagePath: 'assets/images/pricingScreen/Dress.png',
                  title: 'Dress',
                  subtitle: 'Women',
                  price: 160.0,
                  onDecrease: () {},
                  onIncrease: () {},
                ),
                SizedBox(height: 30),
                CommetsTextfield(),
                SizedBox(height: 25),
                CartTotal(
                  price: 240.0,
                ),
                SizedBox(height: 25),
                CustomButton(
                  text: 'Checkout',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
