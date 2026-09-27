import 'package:e_commrece_app/features/%20profile/presentation/profile_view.dart';
import 'package:e_commrece_app/features/category/presentation/category_view.dart';
import 'package:e_commrece_app/features/home/presentation/screen/home_view.dart';
import 'package:e_commrece_app/features/shopping/presentation/shopping_view.dart';
import 'package:flutter/material.dart';

import 'wedgit/custom_bottom_navigation.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  static const routeBottomNavigation = 'bottom_navigation';

  @override
  State<MainNavigationView> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    ShoppingView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
