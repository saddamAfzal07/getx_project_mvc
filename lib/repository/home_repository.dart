import 'package:getx_api_project/model/product_model.dart';
import 'package:getx_api_project/services/http_services.dart';

class HomeRepository {
  static Future getFetchApi(String url) async {
    try {
      final response = await ApiService.getApi(url);

      if (response.statusCode == 200) {
        var jsonData = productsModelFromJson(response.body);
        return jsonData;
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future getPostApi(String endPoint, Map<dynamic, dynamic>? body) async {
    try {
      final response = await ApiService.postApi(endPoint, body);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
