import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/res/appImages/app_images.dart';
import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:eastri_customer_app/utils/appStrings/app_strings.dart';
import 'package:eastri_customer_app/utils/sizeConfig/app_sizeconfig.dart';
import 'package:eastri_customer_app/views/widgets/custom_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentIndex = 0;

  final List<String> imagePaths = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizeconfig.screenHeight * 0.05,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
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
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          AppStrings.welcomeToEastri,
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Text(
                          AppStrings.tiredOfWaitingDaysForClean,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomButton(
            buttonName: AppStrings.signIn,
            isEnabled: true,
            onPressed: () {
              Get.toNamed(AppRoutes.authScreen);
            },
            borderSideEnabled: false,
          ),
          SizedBox(height: 20),
          CustomButton(
            buttonName: AppStrings.createAnAccount,
            textColor: Colors.black,
            backgroundColor: AppColors.secondaryColor,
            isEnabled: false,
            onPressed: () {},
            borderSideEnabled: true,
          ),
        ],
      ),
    );
  }
}
