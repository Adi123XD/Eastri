import 'package:eastri_customer_app/views/screens/dashboard_screen/add_address_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:eastri_customer_app/views/screens/onboarding_screen.dart';
import 'package:eastri_customer_app/views/screens/start_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onBoardScreen = '/onBoardScreen';
  static const String startScreen = '/startScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String addAddressScreen = '/addAddressScreen';

  static final List<GetPage> routes = [
    GetPage(name: onBoardScreen, page: () => OnBoardScreen()),
    GetPage(name: startScreen, page: () => StartScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: addAddressScreen, page: () => AddAddressScreen()),
  ];
}
