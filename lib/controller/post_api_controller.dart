import 'package:get/get.dart';

import 'package:getx_api_project/repository/home_repository.dart';
import 'package:getx_api_project/services/http_services.dart';

class PostController extends GetxController {
  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postData(String name, String job) async {
    print("Enter into post Data");
    try {
      final fetchedItems =
          await HomeRepository.getPostApi("users", {"name": name, "job": job});

      print("Data==>>${fetchedItems}");
    } catch (e) {
      print('Error: $e');
    }
  }
}
