import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class EnvironmentContainer extends StatelessWidget {
  const EnvironmentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: screenWidth * 0.9,
        height: 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/images/dashboard/environment_image.png',
              fit: BoxFit.cover,
            ),

            // Overlay Gradient Image
            Image.asset(
              'assets/images/dashboard/Rectangle.png',
              fit: BoxFit.cover,
            ),

            // Centered Content (Text + Button)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Redefining sustainability:\n Eastri’s commitment to the environment",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.onBoardScreen);
                    },
                    child: Container(
                      height: 34,
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: AppColors.globalButton,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Learn more',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
