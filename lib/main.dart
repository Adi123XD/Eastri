import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/utils/appTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.startScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
