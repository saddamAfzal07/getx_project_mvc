import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/controller/product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController apiController = Get.put(ProductController());
    return Scaffold(
      body: Obx(
        () => apiController.productsList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: apiController.productsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(apiController.productsList[index].name),
                  );
                },
              ),
      ),
    );
  }
}
