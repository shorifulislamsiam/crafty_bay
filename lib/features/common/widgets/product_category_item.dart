import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/product/ui/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: "Computers");
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
            child: Icon(
              Icons.computer,
              size: 35,
              color: AppColors.themeColor,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            "Computer",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}