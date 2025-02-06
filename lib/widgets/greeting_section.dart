import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  String _getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning Laksh!";
    } else if (hour < 18) {
      return "Good Afternoon Laksh!";
    } else {
      return "Good Evening Laksh!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 211,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF307597),
            Color(0xFF102631),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              _getGreeting(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your day just got easier.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 24,
                width: screenWidth * 0.75,
                decoration: BoxDecoration(
                  color: AppColors.globalButton,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: Colors.white,
                      size: 13,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
