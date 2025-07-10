import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavControllers());
    Get.put(
      NetworkClients(
        commonHeaders: _commonHeaders,
        onUnAuthorize: _unAuthorize,
      ),
    );
    Get.put(SignUpController());
    Get.put(VerifyOTPController());
    Get.put(AuthController());
  }

  final Map<String, String> _commonHeaders = {
    "content-type": "application/json",
    "token": "",
  };
  void _unAuthorize() {
    //TODO: Logout from app and re-login
  }

  //when get error of return common headers function return error, try with it
  // Map<String, String> _commonHeader(){
  //   return{
  //
  //   };
  // }
}
