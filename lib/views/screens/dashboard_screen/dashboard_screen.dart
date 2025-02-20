import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/dashboard_container.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/environment_container.dart';
import 'package:eastri_customer_app/views/widgets/greeting_section.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/service_items.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/widgets/wallet_container.dart';
import 'package:eastri_customer_app/views/widgets/translate_contianer.dart';
import 'package:eastri_customer_app/views/widgets/blurred_gradient_container.dart'; // Import the new widget

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: Stack(
        children: [
          BlurredGradientContainer(
            height: screenHeight * 0.2,
            child: Container(),
          ),
          SafeArea(
            child: Column(
              children: [
                GreetingSection(
                  icon: Icons.menu,
                  onIconPressed: () {},
                ),
                TranslateContianer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Services",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceItem(
                            imagePath: 'assets/images/dashboard/iron2.png',
                            onTap: () {
                              Get.offNamed('/pricingTabScreen');
                            },
                            imageHeight: screenWidth * 0.2,
                            imageWidth: screenWidth * 0.2,
                            text: 'Iron',
                          ),
                          ServiceItem(
                            imagePath: 'assets/images/dashboard/iron1.png',
                            onTap: () {
                              Get.offNamed(
                                '/pricingTabScreen',
                                arguments: {'selectedIndex': 1},
                              );
                            },
                            imageHeight: screenWidth * 0.33,
                            imageWidth: screenWidth * 0.33,
                            text: "Steamed Iron",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.globalButton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Schedule Pickup",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Active orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          print("Order container tapped");
                        },
                        child: Container(
                          width: screenWidth * 0.8,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(5, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.home,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Order no. 57290854",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Track order",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF153241),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DashboardContainer(
                        items: [
                          DashboardItem(
                            imagePath:
                                'assets/images/dashboard/DashContainer.png',
                            line1: 'FEATURED FOR YOU',
                            line2: 'Time to Reorder!',
                            line3:
                                '10 shirts and 5 trousers are your go-to. Earn 20 reward points when you schedule now!',
                            buttonText: 'Claim & Schedule',
                          ),
                          DashboardItem(
                            imagePath:
                                'assets/images/dashboard/DashContainer2.png',
                            line1: 'FEATURED FOR YOU',
                            line2: "It's winter!",
                            line3: 'Special Care for woolens available.',
                            buttonText: 'Order now',
                          ),
                          DashboardItem(
                            imagePath:
                                'assets/images/dashboard/DashContainer3.png',
                            line1: 'FEATURED FOR YOU',
                            line2: 'Try Eastri Pro for Rs. 50/- off',
                            line3: 'Ends in 00:28:11',
                            buttonText: 'Flat 50% off',
                          ),
                          DashboardItem(
                            imagePath:
                                'assets/images/dashboard/DashContainer4.png',
                            line1: 'FEATURED FOR YOU',
                            line2: 'Your laundry will be ready tomorrow.',
                            line3: 'Need express delivery?',
                            buttonText: 'Upgrade to Express',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      WalletContainer(),
                      SizedBox(height: 20),
                      EnvironmentContainer(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
