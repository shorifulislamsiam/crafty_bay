import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHomeScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wish List"),
          leading: IconButton(
            onPressed: _backToHomeScreen,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            //return FittedBox(child: ProductCard());
          },
        ),
      ),
    );
  }
}

_backToHomeScreen() {
  Get.find<MainBottomNavControllers>().backToHome();
}
