import 'package:flutter/material.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/add_address_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:eastri_customer_app/views/screens/wallet_screen/wallet_screen1.dart';
import 'widgets/custom_row_tab.dart';

class SteamIronPricingScreen extends StatelessWidget {
  const SteamIronPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomRowTab(
          pages: [
            WalletScreen1(),
            AddAddressScreen(),
            DashboardScreen(),
          ],
        ),
      ),
    );
  }
}
