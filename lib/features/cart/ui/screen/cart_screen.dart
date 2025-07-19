import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/features/cart/ui/controller/cart_item_controller.dart';
import 'package:crafty_bay/features/cart/ui/widget/cart_item.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartItemController _cartItemController = Get.find<CartItemController>();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartItemController.getCartItem();
    });

  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHomeScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _backToHomeScreen,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text("Cart"),
        ),
        body: GetBuilder(
          init: _cartItemController,
          builder: (_) {
            if(_cartItemController.inProgress){
              return centerCircularProgressIndicator();
            }
            if (_cartItemController.errorMessage != null) {
              return Center(child: Text(_cartItemController.errorMessage!));
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemCount: _cartItemController.cartItem.length,
                      itemBuilder: (context, index) {
                        return CartItem(cartItemModel: _cartItemController.cartItem[index],);
                      },
                    ),
                  ),
                ),
                _buildPriceAndCheckOutSection(),
              ],
            );
          }
        ),
      ),
    );
  }
  Widget _buildPriceAndCheckOutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("৳ ${_cartItemController.totalPrice}",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w500,
                ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text("CheckOut")),
          ),
        ],
      ),
    );
  }
}





_backToHomeScreen() {
  Get.find<MainBottomNavControllers>().backToHome();
}
