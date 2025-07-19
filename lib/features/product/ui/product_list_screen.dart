import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/models/category_list_model.dart';
import 'package:crafty_bay/features/common/widgets/product_card.dart';
import 'package:crafty_bay/features/product/controller/product_list_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryListModel category;
  static final String name = "/product-list-screen";

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListByCategoryController _productListByCategoryController =
      ProductListByCategoryController();
  @override
  void initState() {
    _productListByCategoryController.getProductList(
      widget.category.id,
    );
    _scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<ProductListByCategoryController>().getProductList(
        widget.category.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(widget.category.title),
      ),
      body: GetBuilder(
        init: _productListByCategoryController,
        builder: (controller) {
          if (controller.initialInProgress) {
            return centerCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.builder(
                    itemCount: controller.productModelList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(child: ProductCard(
                        productModel: controller.productModelList[index],
                      ));
                    },
                  ),
                ),
              ),
              Visibility(
                visible: controller.inProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
