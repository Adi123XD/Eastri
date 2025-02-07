import 'package:eastri_customer_app/views/screens/auth_screen.dart';
import 'package:eastri_customer_app/views/screens/otp_screen.dart';
import 'package:eastri_customer_app/views/screens/select_location_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String authScreen = '/authScreen';
  static const String otpScreen = '/otpScreen';
  static const String selectLocationScreen = '/selectLocationScreen';

  static final List<GetPage> routes = [
    GetPage(name: authScreen, page: () => AuthScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen()),
    GetPage(name: selectLocationScreen, page: () => SelectLocationScreen()),
  ];
}
