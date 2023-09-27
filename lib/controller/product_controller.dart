import 'package:get/get.dart';
import 'package:getx_api_project/model/product_model.dart';
import 'package:getx_api_project/repository/home_repository.dart';
import 'package:getx_api_project/services/http_services.dart';

class ProductController extends GetxController {
  ApiService apiService = ApiService();

  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final fetchedItems = await HomeRepository.getFetchApi(
          "api/v1/products.json?brand=maybelline");
      productsList.value = fetchedItems;
    } catch (e) {
      print('Error: $e');
    }
  }
}
