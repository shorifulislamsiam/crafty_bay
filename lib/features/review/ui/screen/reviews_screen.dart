import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/widgets/bottom_nav_widget.dart';
import 'package:crafty_bay/features/product/ui/products_details_screen.dart';
import 'package:crafty_bay/features/review/ui/screen/create_reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  static final String name = "/reviews";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            //Navigator.pushNamed(context, MainBottomNavScreen.name,);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Reviews",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemCount: 8,
              itemBuilder: (context, index) {
                return _reviewsCard(context);
              },
            ),
          ),
          buildPriceAndAddToCartSection(
            text: Text("Reviews (100)"),
            button: CircleAvatar(
              child: FittedBox(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateReviewsScreen.name);
                  },
                  icon: Icon(Icons.add, size: 35),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4, top: 4, bottom: 4),
          child: Column(
            children: [
              Row(
                spacing: 8,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 14,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                  Text(
                    "Person Name",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.
                                    """,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
