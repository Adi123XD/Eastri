import 'package:eastri_customer_app/views/screens/dashboard_screen/add_address_screen.dart';
import 'package:eastri_customer_app/views/screens/dashboard_screen/dashboard_screen.dart';
import 'package:eastri_customer_app/views/screens/wallet_screen/wallet_screen1.dart';
import 'package:flutter/material.dart';

class SteamIronPricingScreen extends StatefulWidget {
  const SteamIronPricingScreen({super.key});

  @override
  State<SteamIronPricingScreen> createState() => _SteamIronPricingScreenState();
}

class _SteamIronPricingScreenState extends State<SteamIronPricingScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    WalletScreen1(),
    AddAddressScreen(),
    DashboardScreen(),
  ];

  final List<String> _tabLabels = ['Wallet', 'Add Address', 'Dashboard'];
  final List<String> _tabImages = [
    'assets/images/pricingScreen/men.png',
    'assets/images/pricingScreen/women.png',
    'assets/images/pricingScreen/kids.png',
  ];

  // Define colors
  final Color selectedColor = const Color(0xFF2E6F90); // #2E6F90
  final Color unselectedColor = const Color(0xFFE2E2E2); // #E2E2E2

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _pages.length,
                (index) => CustomTab(
                  imagePath: _tabImages[index],
                  label: _tabLabels[index],
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
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomTab({
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = const Color(0xFF2E6F90),
    this.unselectedColor = const Color(0xFFE2E2E2),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedColor : unselectedColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
