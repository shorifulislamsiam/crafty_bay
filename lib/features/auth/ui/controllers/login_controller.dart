import 'dart:convert';

import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/auth/data/model/login_request_model.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/models/user_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> login(LoginRequestModel loginRequestModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().postRequest(
      Urls.loginUrl,
      body: loginRequestModel.toJson(),
    );
    if(response.isSuccess){
      await Get.find<AuthController>().saveUserData(
          response.responseData!["data"]["token"],
        UserModel.fromJson(response.responseData!["data"]["user"])
      );
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
