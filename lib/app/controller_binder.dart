import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/auth/ui/controllers/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/features/auth/ui/screen/login_screen.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/home_slider_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  AuthController _authController = AuthController();
  @override
  void dependencies() {
    Get.put(_authController);
    Get.put(MainBottomNavControllers());
    Get.put(
      NetworkClients(
        commonHeaders: _commonHeaders(),
        onUnAuthorize: _unAuthorize,
      ),
    );
    Get.put(SignUpController());
    Get.put(VerifyOTPController());
    Get.put(HomeSliderController());
    Get.put(LoginController());

  }


  // final Map<String, String> _commonHeaders = {
  //     "content-type": "application/json",
  //     "token": Get.find<AuthController>().accessToken ?? "",
  //
  // };

   Map<String, String> _commonHeaders () {
    return {
      "content-type": "application/json",
      "token": _authController.accessToken ?? "",
    };
  }
  void _unAuthorize() async{
    //TODO: Logout from app and re-login
    await _authController.clearUserData();
    Get.to(()=>LoginScreen.name);
  }

  //when get error of return common headers function return error, try with it
  // Map<String, String> _commonHeader(){
  //   return{
  //
  //   };
  // }
}
