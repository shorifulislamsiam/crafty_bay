import 'package:crafty_bay/features/cart/ui/screen/cart_screen.dart';
import 'package:crafty_bay/features/common/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/home_slider_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/new_products_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/popular_products_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/special_products_controller.dart';
import 'package:crafty_bay/features/home/ui/screen/home_screen.dart';
import 'package:crafty_bay/features/product/ui/products_category_screen.dart';
import 'package:crafty_bay/features/wish_list/ui/screens/wish_list_screen.dart';
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
    CartScreen(),
    WishListScreen(),
  ];
  final controller = Get.find<MainBottomNavControllers>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<HomeSliderController>().getHomeSliders();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductsListController>().getPopularProducts();
      Get.find<SpecialProductsController>().getSpecialProducts();
      Get.find<NewProductListController>().getNewProducts();
    });
  }

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
