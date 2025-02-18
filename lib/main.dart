import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Eastri',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineMedium: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
            headlineSmall: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white70,
            ),
            bodyMedium: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white60,
            ),
            bodySmall: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey,
            ),
          )),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.startScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
