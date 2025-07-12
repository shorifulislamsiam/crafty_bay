import 'dart:convert';

import 'package:crafty_bay/features/common/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{

  String? accessToken; //static
  UserModel? userModel; //static

  final String _tokenKey = "token";
  final String _userDataKey = "user-data";

  Future<void> saveUserData(String token,UserModel model)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, token);
    sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
  }

  Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);
    if( userData != null){
      userModel = UserModel.fromJson(jsonDecode(userData));
      accessToken = tokenData;
    }
  }
  Future<bool> isUserLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if( tokenData != null){
      await getUserData();
      return true;
    }else{
      return false;
    }
  }
  Future<void> clearUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
}