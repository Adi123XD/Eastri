import 'package:get/get.dart';

class AppSizeconfig {
  // Directly use Get.width and Get.height
  static double get screenWidth => Get.width;
  static double get screenHeight => Get.height;

  // Multipliers for responsive UI
  static double get widthMultiplier => screenWidth / 100;
  static double get heightMultiplier => screenHeight / 100;
  static double get textMultiplier => heightMultiplier;
}
