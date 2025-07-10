import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/auth/data/model/verify_otp_model.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/models/user_model.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> otpVerify(VerifyOTPModel otpModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().postRequest(
      Urls.verifyOtpUrl,
      body: otpModel.toJson(),
    );
    if(response.isSuccess){
      await Get.find<AuthController>().saveUserData(
          response.responseData!["data"]["token"],
          UserModel.fromJson(response.responseData!["data"]["user"]),
      );
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
