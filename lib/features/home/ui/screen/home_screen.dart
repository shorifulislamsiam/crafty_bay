import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/widgets/product_card.dart';
import 'package:crafty_bay/features/common/widgets/product_category_item.dart';
import 'package:crafty_bay/features/home/ui/widget/AppBar_Icon_Button.dart';
import 'package:crafty_bay/features/home/ui/widget/home_carousel_slider_widget.dart';
import 'package:crafty_bay/features/home/ui/widget/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              buildSectionHeader(
                context,
                title: "Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavControllers>().moveToCategory();
                },
              ),
              _getCategoriesList(),
              buildSectionHeader(context, title: "Popular", onTapSeeAll: () {}),
              _getPopularProducts(),
              buildSectionHeader(context, title: "Special", onTapSeeAll: () {}),
              _getSpecialProducts(),
              buildSectionHeader(context, title: "New", onTapSeeAll: () {}),
              _getNewProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 16,
        children: [1,2,3,4].map((e)=> ProductCard()).toList(),
      ),
    );
  }
  Widget _getSpecialProducts(){
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return ProductCard();
          }, separatorBuilder: (context,index){
            return SizedBox(width: 16,);
      }, itemCount: 8),
    );
  }

  Widget _getNewProducts(){
    return SizedBox(
      height: 180,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return ProductCard();
          }, separatorBuilder: (context,index){
        return SizedBox(width: 16,);
      }, itemCount: 8),
    );
  }

  SizedBox _getCategoriesList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        itemCount: 7,
        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
      ),
    );
  }

  Row buildSectionHeader(
    BuildContext context, {
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        TextButton(onPressed: onTapSeeAll, child: Text("See All")),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.logoNav),
      actions: [
        AppBarIconButton(onTap: () {}, iconData: Icons.person),
        AppBarIconButton(onTap: () {}, iconData: Icons.call),
        AppBarIconButton(onTap: () {}, iconData: Icons.notifications),
      ],
    );
  }
}


