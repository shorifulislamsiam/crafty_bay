import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/product/data/model/product_details_model.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().postRequest(
      Urls.addToCartUrl,
      body: {"product": id},
    );
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
