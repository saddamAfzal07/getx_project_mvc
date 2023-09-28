import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/constants/shimmer.dart';
import 'package:getx_api_project/controller/dio_product_controller.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final ProductController2 controller = Get.put(ProductController2());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Products With Dio"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcom Guest",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(child: Obx(
              () {
                return MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: controller.productList.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var product = controller.productList[index];
                      if (controller.isLoading.value) {
                        print("Enter into if condition");
                        return const ProductShimmer();
                      } else {
                        print("Enter into else");
                        return Card(
                          child: SizedBox(
                            height: 250,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    product.imageLink,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(product.name.toString()),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$${product.price}"),
                                    Row(
                                      children: [
                                        Text(product.rating.toString()),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    });
              },
            )),
          ],
        ),
      ),
    );
  }
}
