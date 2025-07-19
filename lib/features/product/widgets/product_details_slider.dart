import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({
    super.key, required this.photoSlider,
  });

  final List<String> photoSlider;
  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 240,
              viewportFraction: 1,
              onPageChanged: (int currentIndex, _){
                _currentSlider.value = currentIndex;
              }
            //autoPlay: true,
            //autoPlayInterval: Duration(seconds: 3)
          ),
          items: widget.photoSlider.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: NetworkImage(image))
                    ),
                    alignment: Alignment.center,
                    //child: Text('Picture $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentSlider,
            builder: (context, index, _){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0; i<widget.photoSlider.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(left: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600,width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: index==i? AppColors.themeColor:Colors.white,
                      ),
                    )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}