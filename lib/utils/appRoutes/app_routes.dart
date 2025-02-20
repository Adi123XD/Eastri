import 'package:eastri_customer_app/views/screens/dashboard_screen/add_address_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:eastri_customer_app/views/screens/onBoarding_screen/onboarding_screen.dart';
import 'package:eastri_customer_app/views/screens/pricing_screen.dart/pricing_tab_screen.dart';
import 'package:eastri_customer_app/views/screens/start_screen/start_screen.dart';
import 'package:eastri_customer_app/views/screens/wallet_screen/wallet_screen1.dart';
import 'package:get/get.dart';

import '../../views/screens/checkout_screen/checkout_screen.dart';
import '../../views/screens/pricing_screen.dart/iron_pricing_screen.dart';
import '../../views/screens/pricing_screen.dart/steam_iron_pricing_screen.dart';

class AppRoutes {
  static const String onBoardScreen = '/onBoardScreen';
  static const String startScreen = '/startScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String addAddressScreen = '/addAddressScreen';
  static const String wallet1Screen = '/wallet1Screen';
  static const String pricingTabScreen = '/pricingTabScreen';
  static const String ironPricingScreen = '/ironPricingScreen';
  static const String steamIronPricingScreen = '/steamIronPricingScreen';
  static const String checkoutScreen = '/checkoutScreen';

  static final List<GetPage> routes = [
    GetPage(name: onBoardScreen, page: () => OnBoardScreen()),
    GetPage(name: startScreen, page: () => StartScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: addAddressScreen, page: () => AddAddressScreen()),
    GetPage(name: wallet1Screen, page: () => WalletScreen1()),
    GetPage(name: pricingTabScreen, page: () => PricingTabScreen()),
    GetPage(name: ironPricingScreen, page: () => IronPricingScreen()),
    GetPage(name: steamIronPricingScreen, page: () => SteamIronPricingScreen()),
    GetPage(name: checkoutScreen, page: () => CheckoutScreen()),
  ];
}
