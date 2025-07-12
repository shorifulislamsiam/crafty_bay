import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/home/data/model/home_slider_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  List<HomeSliderModel> _homeSliderList = [];
  List<HomeSliderModel> get homeSliderList => _homeSliderList;
  
  Future<bool> getHomeSliders()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkClients>().getRequest(Urls.homeSliderUrl);
    if(response.isSuccess){
      List <HomeSliderModel> _list = [];
      for(Map<String,dynamic>slider in response.responseData!["data"]["results"]){
        _list.add(HomeSliderModel.fromJson(slider));
      }
      _homeSliderList = _list;
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update;
    return isSuccess;

  }
}