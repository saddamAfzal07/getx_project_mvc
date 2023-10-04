import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/controller/post_api_controller.dart';

class PostApiHttp extends StatelessWidget {
  const PostApiHttp({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          postController.postData("John Vick", "Manager");
        },
        child: Text("Submit"),
      ),
    ));
  }
}
