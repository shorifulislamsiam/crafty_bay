
import 'package:crafty_bay/features/auth/ui/screen/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screen/sign_up_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/product/ui/product_list_screen.dart';
import 'package:crafty_bay/features/product/ui/products_details_screen.dart';
import 'package:crafty_bay/features/review/ui/screen/create_reviews_screen.dart';
import 'package:crafty_bay/features/review/ui/screen/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screen/splash_screen.dart';

class AppRoutes{
  static Route<dynamic> route (RouteSettings settings){
    late final Widget screenWidget;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }else if(settings.name == LoginScreen.name){
      screenWidget = LoginScreen();
    }else if(settings.name == SignUpScreen.name){
      screenWidget = SignUpScreen();
    }else if(settings.name == MainBottomNavScreen.name){
      screenWidget = MainBottomNavScreen();
    }else if(settings.name == ProductListScreen.name){
      final String category = settings.arguments as String;
      screenWidget= ProductListScreen(category: category);
    }else if(settings.name == ProductsDetailsScreen.name){
      final String productId = settings.arguments as String;
      screenWidget = ProductsDetailsScreen(productId: productId);
    }else if(settings.name == ReviewsScreen.name){
      screenWidget = ReviewsScreen();
    }else if(settings.name == CreateReviewsScreen.name){
      screenWidget = CreateReviewsScreen();
    }



    return MaterialPageRoute(builder: (context)=> screenWidget);
  }
}