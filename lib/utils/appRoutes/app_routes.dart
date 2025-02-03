import 'package:eastri_customer_app/views/screens/onboarding_screen.dart';
import 'package:eastri_customer_app/views/screens/start_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = '/loginScreen';
  static const String startScreen = '/startScreen';

  static final List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => OnBoardScreen()),
    GetPage(name: startScreen, page: () => StartScreen()),
  ];
}
