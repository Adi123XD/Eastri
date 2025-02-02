import 'package:eastri_customer_app/views/screens/auth_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String authScreen = '/authScreen';

  static final List<GetPage> routes = [
    GetPage(name: authScreen, page: () => AuthScreen())
  ];
}

