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
            const SizedBox(height: 35),
            Row(
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  color: Colors.white,
                  size: 13,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: const Text(
                    'Durlabh Niwas, 1/461, Dr Baba Saheb Chawk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
