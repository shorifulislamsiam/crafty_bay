
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/product/data/model/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  late ProductDetailsModel _productDetailsModel;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  ProductDetailsModel get  productDetailsModel=> _productDetailsModel;

  Future<bool> getProductsDetails(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().getRequest(Urls.productDetailsUrl(id));
    if(response.isSuccess){
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData!["data"]);
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