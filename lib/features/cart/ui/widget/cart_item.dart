import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/features/cart/data/model/cart_item_model.dart';
import 'package:crafty_bay/features/cart/ui/controller/cart_item_controller.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:crafty_bay/features/product/controller/product_details_controller.dart';
import 'package:crafty_bay/features/product/data/model/product_details_model.dart';
import 'package:crafty_bay/features/product/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Image.network(
              width: 100,
              height: 100,
              fit: BoxFit.scaleDown,
              cartItemModel.productModel.photoUrl.first,
              errorBuilder: (_, __, ___) {
                return Center(child: Icon(Icons.error_outline));
              },
              //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZgGjOyPjKbKQuEdjcBisy7FwFDXgCM6hBgA&s",
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 4, right: 12, top: 4, bottom: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.productModel.title,
                              //widget.cartItemModel.productModel.title,
                              //_productDetailsController.title,
                              //"New Year Special Shoe",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              'Color: ${cartItemModel.color}  Size: ${cartItemModel.size}',
                              style: Theme.of(
                                context,
                              ).textTheme.headlineSmall?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "৳ ${cartItemModel.productModel.currentPrice}",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: FittedBox(
                          child: IncDecButton(
                            onChange: (int value) {
                              Get.find<CartItemController>().updateQuantity(
                                cartItemModel.id,
                                value,
                              );
                              //cartItemModel.quantity = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
