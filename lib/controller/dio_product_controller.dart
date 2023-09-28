import 'package:get/get.dart';
import 'package:getx_api_project/repository/home_repo.dart';
import 'package:getx_api_project/services/dio_Services.dart';

class ProductController2 extends GetxController {
  final ProductRepo _productRepo = ProductRepo(DioClientServices());

  final productList = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    isLoading(true);
    print("Loading==>>$isLoading");
    final data =
        await _productRepo.getProducts("api/v1/products.json?brand=maybelline");
    print(data.toString());
    if (data != null) {
      isLoading(false);
      productList.value = data;
      print("Data not null==>>${productList.value} ");
      print("Loading==>>$isLoading ");
    } else {
      isLoading(false);
    }
  }
}
