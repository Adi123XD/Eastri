import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  // Map routes to their respective indices
  final Map<String, int> _routeIndices = {
    '/dashboardScreen': 0,
    '/pricingTabScreen': 1,
    '/checkoutScreen': 2,
    '/addAddressScreen': 3,
  };

  @override
  void initState() {
    super.initState();
    _updateCurrentIndex();
  }

  void _updateCurrentIndex() {
    final currentRoute = Get.currentRoute;
    setState(() {
      _currentIndex = _routeIndices[currentRoute] ?? 0;
    });
  }

  void _onItemTapped(int index) {
    final routes = _routeIndices.keys.toList();
    if (index < routes.length) {
      Get.offNamed(routes[index]);
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.globalButton,
      unselectedItemColor: AppColors.globalButton.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 28),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_sharp, size: 28),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined, size: 28),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_sharp, size: 28),
          label: "",
        ),
      ],
    );
  }
}
