import 'package:eastri_customer_app/pages/onboarding_screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OnboardingScreen1());
}

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff2C6A89),
      ),
      home: const OnboardingContent(),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'lib/images/bg.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Image.asset(
              'lib/images/iron.png',
              width: screenSize.width,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'lib/images/overlay.png',
              width: screenSize.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 20,
              top: screenSize.height * 0.45,
              child: Image.asset(
                'lib/images/stars.png',
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: screenSize.height * 0.6,
              child: const Text(
                'Your 30 minutes\nemergency fix',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: screenSize.height * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnboardingScreen2()),
                  );
                },
                child: Image.asset(
                  'lib/images/Group.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
