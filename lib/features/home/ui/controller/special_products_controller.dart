import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';

class SpecialProductsController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<ProductModel> _specialProductsList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<ProductModel> get specialProductsList => _specialProductsList;

  Future<bool> getSpecialProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().getRequest(
      Urls.productsByTags("Special"),
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> product
          in response.responseData!["data"]["results"]) {
        list.add(ProductModel.fromJson(product));
      }
      _specialProductsList = list;
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
