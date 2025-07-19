import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/common/models/category_list_model.dart';
import 'package:crafty_bay/features/product/ui/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.model});

  final CategoryListModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: model);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.2),
              // border: Border.all(
              //   color: AppColors.themeColor.withOpacity(0.2),
              // ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(model.iconUrl,width: 32,height: 32,),
          ),
          SizedBox(height: 5),
          Text(
            _getTitle(model.title),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }

  String _getTitle(String title) {
    if (title.length > 9) {
      return "${title.substring(0, 8)}..";
    }
    return title;
  }
}
