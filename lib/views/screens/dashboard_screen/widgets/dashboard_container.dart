import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:eastri_customer_app/utils/appRoutes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class DashboardItem {
  final String imagePath;
  final String line1;
  final String line2;
  final String line3;
  final String buttonText;
  const DashboardItem({
    required this.imagePath,
    required this.line1,
    required this.line2,
    required this.line3,
    required this.buttonText,
  });
}

class DashboardContainer extends StatefulWidget {
  final List<DashboardItem> items;
  const DashboardContainer({super.key, required this.items});

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      width: screenWidth,
      height: 396,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: widget.items.length,
              options: CarouselOptions(
                height: 396,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final item = widget.items[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.line1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.line2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 16 : 18,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.line3.replaceAll('. ', '.\n'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 14 : 16,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.onBoardScreen);
                            },
                            child: Container(
                              height: 34,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                color: AppColors.globalButton,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  item.buttonText,
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
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.items.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
