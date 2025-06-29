import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/features/home/ui/widget/AppBar_Icon_Button.dart';
import 'package:crafty_bay/features/home/ui/widget/home_carousel_slider_widget.dart';
import 'package:crafty_bay/features/home/ui/widget/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                onTapSeeAll: () {},
              ),
              _getCategoriesList(),
              buildSectionHeader(context, title: "Popular", onTapSeeAll: () {}),
              buildSectionHeader(context, title: "Special", onTapSeeAll: () {}),
              buildSectionHeader(context, title: "New", onTapSeeAll: () {}),
            ],
          ),
        ),
      ),
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
          return Column(
            children: [
              Card(child: Icon(Icons.computer, size: 35)),
              Text("Computer"),
            ],
          );
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
