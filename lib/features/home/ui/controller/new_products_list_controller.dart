import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';

//try in return list type

class NewProductListController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _newProductList = [];
  List<ProductModel> get newProductList => _newProductList;

  Future<List<ProductModel>> getNewProducts() async {
    //bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().getRequest(
      Urls.productsByTags("New"),
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> slider
      in response.responseData!["data"]["results"]) {
        list.add(ProductModel.fromJson(slider));
      }
      _newProductList = list;
      //isSuccess = true;
      _errorMessage = null;
       _newProductList;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return _newProductList;
  }
}