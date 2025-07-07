

import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

Widget buildPriceAndAddToCartSection(
    {
  required Text text, Text? text2,
  required Widget button,
} ){
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: AppColors.themeColor.withOpacity(0.2),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [text, if(text2 != null) text2]),
        SizedBox(
          width: 120,
          child: button,
        ),
      ],
    ),
  );
}