import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/screen/home_screen.dart';
import 'package:crafty_bay/features/product/ui/products_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = "/main_bottom_nav";
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    ProductsCategoryScreen(),
    ProductsCategoryScreen(),
    ProductsCategoryScreen(),
  ];
  final controller = Get.find<MainBottomNavControllers>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavControllers>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: "Category",
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline_rounded),
                label: "Wishlist",
              ),
            ],
          ),
        );
      },
    );
  }
}
