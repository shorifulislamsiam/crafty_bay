import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/auth/data/model/sign_up_request_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late String _message;
  String get message => _message;

  Future<bool> signUp(SignUpRequestModel signUpRequestModel) async {
    bool isSuccess = false;
    _inProgress = false;
    update();
    final NetworkResponse response = await Get.find<NetworkClients>().postRequest(
      Urls.signUpUrl,
      body: signUpRequestModel.toJson(),
    );
    if (response.isSuccess) {
      _message = response.responseData!["msg"];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
