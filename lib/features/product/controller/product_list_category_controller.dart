import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController{
  final int _count = 10;
  int _currentPage = 0;
  int? _lastPage;
  bool _inProgress = false;
  bool _initialInProgress = false;
  String? _errorMessage ;
  final List<ProductModel> _productModelList=[];

  bool get inProgress => _inProgress;
  bool get initialInProgress => _initialInProgress;
  String? get errorMessage =>_errorMessage ;
  List<ProductModel> get productModelList=> _productModelList;

  Future<void> getProductList(String categoryId)async{
    _currentPage ++;
    if(_lastPage != null && _lastPage! < _currentPage){
      return;
    }
    if(_currentPage==1){
      _productModelList.clear;
      _initialInProgress = true;
    }else{
      _inProgress= true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkClients>().getRequest(
      Urls.productByCategory(_count, _currentPage, categoryId)
    );
    if(response.isSuccess){
      _lastPage = response.responseData!["data"]["last_page"] ?? 0;
      List<ProductModel> list =[];
      for(Map<String,dynamic> products in response.responseData!["data"]["results"]){
        list.add(ProductModel.fromJson(products));
      }
      _productModelList.addAll(list);
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }
    if(_currentPage ==1){
      _initialInProgress = false;
    }else{
      _inProgress=false;
    }
    update();
  }
}