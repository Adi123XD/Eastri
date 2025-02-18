import 'package:eastri_customer_app/views/screens/auth_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/add_address_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:eastri_customer_app/views/screens/onboarding_screen.dart';
import 'package:eastri_customer_app/views/screens/otp_screen.dart';
import 'package:eastri_customer_app/views/screens/select_location_screen.dart';
import 'package:eastri_customer_app/views/screens/start_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onBoardScreen = '/onBoardScreen';
  static const String authScreen = '/authScreen';
  static const String otpScreen = '/otpScreen';
  static const String selectLocationScreen = '/selectLocationScreen';
  static const String startScreen = '/startScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String addAddressScreen = '/addAddressScreen';

  static final List<GetPage> routes = [
    GetPage(name: onBoardScreen, page: () => OnBoardScreen()),
    GetPage(name: authScreen, page: () => AuthScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: selectLocationScreen, page: () => SelectLocationScreen()),
    GetPage(name: startScreen, page: () => StartScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: addAddressScreen, page: () => AddAddressScreen()),
  ];
}
