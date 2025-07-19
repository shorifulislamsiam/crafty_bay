import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/core/ui/widget/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/ui/screen/login_screen.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/product/controller/add_to_cart_controller.dart';
import 'package:crafty_bay/features/product/controller/product_details_controller.dart';
import 'package:crafty_bay/features/product/data/model/product_details_model.dart';
import 'package:crafty_bay/features/product/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/product/widgets/product_details_slider.dart';
import 'package:crafty_bay/features/product/widgets/size_picker.dart';
import 'package:crafty_bay/features/review/ui/screen/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, required this.productId});

  final String productId;
  static final String name = "/product-details-screen";
  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToCartController _addToCartController = Get.find<AddToCartController>();

  @override
  void initState() {
    // TODO: implement initState
    _productDetailsController.getProductsDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (_) {
          if (_productDetailsController.inProgress) {
            return centerCircularProgressIndicator();
          }
          if (_productDetailsController.errorMessage != null) {
            return Center(child: Text(_productDetailsController.errorMessage!));
          }
          ProductDetailsModel product =
              _productDetailsController.productDetailsModel;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsSlider(photoSlider: product.photosUrl),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.title,
                                    //"Happy New Year Special Deal Save 30%",
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 0.4,
                                      color: Colors.black54,
                                      //overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                IncDecButton(onChange: (int value) {}),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Text(
                                      "4.8",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      ReviewsScreen.name,
                                    );
                                  },
                                  child: Text("Reviews"),
                                ),
                                Card(
                                  color: AppColors.themeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.favorite_outline_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Visibility(
                              visible: product.colors.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Color",
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),

                                  SizedBox(height: 8),
                                  ColorPicker(
                                    colors:
                                        product
                                            .colors, //["Black", "Blue", "Red", "Pink"]
                                    onSelected: (String onSelected) {},
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Visibility(
                              visible: product.sizes.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Size",
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  SizePicker(
                                    size:
                                        product.sizes, //["S", "M", "L", "XL"],
                                    onSelected: (String onSelected) {},
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Visibility(
                              visible: product.description.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product.description,
                                    //                 """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                                    // """,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(product),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel product) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColors.themeColor.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [Text("Price"), Text("৳ ${product.currentPrice}")]),
          GetBuilder(
            init: _addToCartController,
            builder: (controller) {
              return Visibility(
                visible: _addToCartController.inProgress == false,
                replacement: centerCircularProgressIndicator(),
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(onPressed: _addToCartButton, child: Text("Add To Cart")),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
  void _addToCartButton()async{
    if(await Get.find<AuthController>().isUserLoggedIn() ){
      final bool result = await _addToCartController.addToCart(widget.productId);
      if(result){
        showSnackBarMessage(context, "Add to cart");
      }else{
        showSnackBarMessage(context, _addToCartController.errorMessage!);
      }
    }else{
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
