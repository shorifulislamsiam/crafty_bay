import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:crafty_bay/features/product/ui/products_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsDetailsScreen.name,
          arguments: productModel.id,
        );
      },
      child: Container(
        width: 140,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.themeColor.withOpacity(0.3),
              offset: Offset(0.1, 0.7),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              width: 140,
              padding: EdgeInsets.all(8),
              child:
                  productModel.photoUrl.isNotEmpty &&
                          productModel.photoUrl.first != null
                      ? Image.network(
                        productModel.photoUrl.first,
                        height: 90,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            size: 90,
                            color: Colors.grey,
                          );
                        },
                      )
                      : Icon(
                        Icons.image_not_supported,
                        size: 90,
                        color: Colors.grey,
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    _getTitle(productModel.title),
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "৳ ${productModel.currentPrice}",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text("4.8", style: TextStyle(color: Colors.grey)),
                        ],
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
                ],
              ),
            ),
          ],
        ),
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
