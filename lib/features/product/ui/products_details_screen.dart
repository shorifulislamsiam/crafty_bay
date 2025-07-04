import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/product/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/product/widgets/product_details_slider.dart';
import 'package:crafty_bay/features/product/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, required this.productId});

  final String productId;
  static final String name = "/product-details-screen";
  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Happy New Year Special Deal Save 30%",
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
                                Text("4.8", style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            TextButton(onPressed: () {}, child: Text("Reviews")),
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
                        const SizedBox(height: 16,),
                        Text(
                          "Color",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8,),
                        ColorPicker(
                          colors: ["Black", "Blue", "Red", "Pink"],
                          onSelected: (String onSelected) {},
                        ),
                        const SizedBox(height: 16,),
                        Text("Size",style: Theme.of(context).textTheme.headlineSmall,),
                        const SizedBox(height: 8,),
                        SizePicker(size: ["S","M","L","XL"], onSelected: (String onSelected){}),
                        const SizedBox(height: 16,),
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8,),
                        Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
              """),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
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
          Column(children: [Text("Price"), Text("৳ 2500")]),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: Text("Add To Cart")),
          ),
        ],
      ),
    );
  }
}
