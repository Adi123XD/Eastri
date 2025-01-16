import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const OnboardingScreen2());
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/image2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(child: Image.asset('lib/images/eastri1.png')),

              // Spacer to push button to bottom
              const Spacer(),

              // Sign up button
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: Container(
                  width: 350,
                  height: 110,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 11,
                        top: 20,
                        child: Container(
                          width: 310,
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.03, 1.00),
                              end: Alignment(-0.03, -1),
                              colors: [
                                Colors.white.withOpacity(0),
                                Color(0xFF2C6A89)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              left: BorderSide(
                                color:
                                    Colors.white.withOpacity(0.699999988079071),
                              ),
                              top: BorderSide(
                                width: 1,
                                color:
                                    Colors.white.withOpacity(0.699999988079071),
                              ),
                              right: BorderSide(
                                color:
                                    Colors.white.withOpacity(0.699999988079071),
                              ),
                              bottom: BorderSide(
                                color:
                                    Colors.white.withOpacity(0.699999988079071),
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: 30,
                        child: SizedBox(
                          width: 372,
                          child: Text(
                            'sign up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
