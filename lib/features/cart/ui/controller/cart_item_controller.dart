import 'dart:convert';

import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/cart/data/model/cart_item_model.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:crafty_bay/features/product/data/model/product_details_model.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  List<CartItemModel> _cartList =[];
  
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<CartItemModel> get cartItem => _cartList;
  
  Future<bool> getCartItem()async{
    bool isSuccess = false;
    _inProgress =true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().getRequest(Urls.cartItemUrl);
    if(response.isSuccess){
      List<CartItemModel> _list =[];
      for(Map<String,dynamic> model in response.responseData!["data"]?["results"]){
        _list.add(CartItemModel.fromJson(model));
      }
      _cartList = _list;
     isSuccess = true;
     _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
  int get totalPrice{
    int sum= 0;
    for(CartItemModel cartItemModel in _cartList){
      sum += (cartItemModel.productModel.currentPrice * cartItemModel.quantity);
    }
    return sum;
  }
  void updateQuantity(String id,int quantity){
    for(CartItemModel cartItemModel in _cartList){
      if(cartItemModel.id == id){
        cartItemModel.quantity = quantity;
        update();
        break;

      }
    }
  }

}