import 'package:eastri_customer_app/views/screens/pricing_screen.dart/iron_pricing_screen.dart';
import 'package:eastri_customer_app/views/screens/pricing_screen.dart/steam_iron_pricing_screen.dart';
import 'package:eastri_customer_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class PricingTabScreen extends StatefulWidget {
  const PricingTabScreen({super.key});

  @override
  State<PricingTabScreen> createState() => _PricingTabScreenState();
}

class _PricingTabScreenState extends State<PricingTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white60,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: _tabController.index == 0
                        ? const Color(0xFF2C6A89)
                        : const Color(0xFFEDA934),
                  ),
                ),
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: '  Iron  '),
                  Tab(text: ' Steam Iron '),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            IronPricingScreen(),
            SteamIronPricingScreen(),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
