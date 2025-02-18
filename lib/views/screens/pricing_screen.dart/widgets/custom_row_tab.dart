import 'package:flutter/material.dart';
import 'custom_tab.dart';

class CustomRowTab extends StatefulWidget {
  final List<Widget> pages;
  final List<String> tabLabels;
  final List<String> tabImages;
  final List<double> tabImagesTopPosition;
  final List<double> tabImagesLeftPosition;
  final List<double> imageHeights;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomRowTab({
    super.key,
    required this.pages,
    this.tabLabels = const ['Men', 'Women', 'Kids'],
    this.tabImages = const [
      'assets/images/pricingScreen/men.png',
      'assets/images/pricingScreen/women.png',
      'assets/images/pricingScreen/kids.png',
    ],
    this.tabImagesTopPosition = const [-9, -14, -28],
    this.tabImagesLeftPosition = const [10, 13, 3],
    this.imageHeights = const [76, 80, 95],
    this.selectedColor = const Color(0xFF2E6F90),
    this.unselectedColor = const Color(0xFFE2E2E2),
  });

  @override
  State<CustomRowTab> createState() => _CustomRowTabState();
}

class _CustomRowTabState extends State<CustomRowTab> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            widget.pages.length,
            (index) => CustomTab(
              imageLeftPosition: widget.tabImagesLeftPosition[index],
              imageTopPosition: widget.tabImagesTopPosition[index],
              imageHeight: widget.imageHeights[index],
              imagePath: widget.tabImages[index],
              label: widget.tabLabels[index],
              isSelected: _selectedIndex == index,
              onTap: () => _onTabTapped(index),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}
