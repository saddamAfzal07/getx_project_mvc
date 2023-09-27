import 'package:getx_api_project/constants/app_baseUrl.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future getApi(String endPoint) async {
    try {
      final response = await http.get(Uri.parse(AppBaseUrl.baseUrl + endPoint));

      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
