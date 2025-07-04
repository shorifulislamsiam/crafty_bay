import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/product/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Image.network(
                            width: 100,
                            height: 100,
                            fit: BoxFit.scaleDown,
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZgGjOyPjKbKQuEdjcBisy7FwFDXgCM6hBgA&s",
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 4,
                              right: 12,
                              top: 4,
                              bottom: 16,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "New Year Special Shoe",
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.headlineSmall,
                                          ),
                                          Text(
                                            "Color: black, Size: X",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "৳ 2500",
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
                                          onChange: (int value) {},
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
                },
              ),
            ),
            _buildPriceAndCheckOutSection(),
          ],
        ),
      ),
    );
  }
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
            Text("৳ 2500",style: TextStyle(
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

_backToHomeScreen() {
  Get.find<MainBottomNavControllers>().backToHome();
}
