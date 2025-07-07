import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

TextFormField reviewsTextField(context,String text, int maxLine) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: TextInputType.text,
    maxLines: maxLine,
    textInputAction: TextInputAction.next,
    textAlign: TextAlign.start,
    decoration: InputDecoration(
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.only(left: 8, top: 8),
      fillColor: Colors.white,
      filled: true,
      labelText: text,
      labelStyle: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(color: Colors.grey.shade400),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 1),
      ),
    ),
    validator: (String? value){
      if(value?.isNotEmpty == true){
        return null;
      }
      return "Please fill this box";
    },

  );
}