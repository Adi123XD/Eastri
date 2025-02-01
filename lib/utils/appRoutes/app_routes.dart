import 'package:eastri_customer_app/views/screens/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = '/loginScreen';

  static final List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => LoginScreen())
  ];
}
