import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/home/data/model/home_slider_model.dart';
import 'package:crafty_bay/features/home/ui/controller/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliderModel});

  final List<HomeSliderModel> sliderModel;
  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);
  // final HomeSliderController _homeSliderController =
  //     Get.find<HomeSliderController>();
  final List <HomeSliderModel> _sliders = Get.find<HomeSliderController>().homeSliderList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
            //autoPlay: true,
            //autoPlayInterval: Duration(seconds: 3)
          ),
          items:
          widget.sliderModel.map((slider) {   //widget.sliderModel
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(slider.photo_url),
                          fit: BoxFit.cover,
                        ),
                      ),

                      alignment: Alignment.center,
                      //child: Text('text ', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliderModel.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: index == i ? AppColors.themeColor : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
