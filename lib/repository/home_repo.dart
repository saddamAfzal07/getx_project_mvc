import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_api_project/constants/app_baseUrl.dart';
import 'package:getx_api_project/model/product_model.dart';
import 'package:getx_api_project/services/dio_Services.dart';

class ProductRepo {
  final DioClientServices _dioClient;

  ProductRepo(this._dioClient);

  Future<List<ProductsModel>?> getProducts(url) async {
    final response = await _dioClient.get(url);

    if (response.statusCode == 200) {
      var jsonData = response.data;
      var jsonString = jsonEncode(jsonData);
      return productsModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
