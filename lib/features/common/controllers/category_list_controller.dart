import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network/network_clients.dart';
import 'package:crafty_bay/features/common/models/category_list_model.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final int _count = 10;
  int _currentPage = 0;
  int? _lastPage;
  bool _inProgress = false;
  bool _initialInProgress = false;
  String? _errorMessage;
  final List<CategoryListModel> _categoryList = [];

  bool get inProgress => _inProgress;
  bool get initialInProgress => _initialInProgress;
  String? get errorMessage => _errorMessage;
  List<CategoryListModel> get categoryList => _categoryList;

  int get homeCategoryListItemLength =>
      _categoryList.length > 10 ? 10 : _categoryList.length;

  Future<void> getCategoryList() async {
    _currentPage++;
    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }

    if (_currentPage == 1) {
      _categoryList.clear();
      _initialInProgress = true;
    } else {
      _inProgress = true;
    }
    update();

    NetworkResponse response = await Get.find<NetworkClients>().getRequest(
      Urls.categoryListUrl(_count, _currentPage),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!["data"]["last_page"] ?? 0;
      List<CategoryListModel> list = [];
      for (Map<String, dynamic> model
          in response.responseData!["data"]["results"]) {
        list.add(CategoryListModel.fromJson(model));
      }
      _categoryList.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    if(_currentPage == 1){
      _initialInProgress =false;
    }else{
      _inProgress = false;
    }
    update();
  }
}
