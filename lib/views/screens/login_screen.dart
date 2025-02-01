import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/widgets/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/images/Ellipse1.png',
    'assets/images/Ellipse2.png',
    'assets/images/Ellipse3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imagePaths.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagePaths.asMap().entries.map((entry) {
              return Container(
                width: 24,
                height: 2.5,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : const Color(0xFFAFA7A7),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Welcome to eastri',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                  color: AppColors.title1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'Tired of waiting days for clean clothes? Get your clothes ironed done in just one day!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: AppColors.title2,
                ),
              ),
            ),
          ),
          Spacer(),
          AuthButton(
            text: 'Sign In',
            backgroundColor: AppColors.signInbutton,
            textColor: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          AuthButton(
            text: 'Create an Account',
            backgroundColor: AppColors.signUpbutton,
            textColor: Colors.black,
            onPressed: () {},
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
