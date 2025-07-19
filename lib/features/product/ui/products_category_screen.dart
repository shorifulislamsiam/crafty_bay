import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsCategoryScreen extends StatefulWidget {
  const ProductsCategoryScreen({super.key});

  @override
  State<ProductsCategoryScreen> createState() => _ProductsCategoryScreenState();
}

class _ProductsCategoryScreenState extends State<ProductsCategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController =
      Get.find<CategoryListController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      Get.find<CategoryListController>().getCategoryList();
      //_categoryListController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavControllers>().backToHome();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: GetBuilder<CategoryListController>(
        builder: (controller) {
          if (controller.initialInProgress) {
            return centerCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: controller.categoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCategoryItem(
                          model: controller.categoryList[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                  visible: controller.inProgress,
                  child: LinearProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
