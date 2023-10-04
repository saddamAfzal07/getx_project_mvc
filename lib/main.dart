import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/view/get_api/dio_get_api.dart';
import 'package:getx_api_project/view/get_api/get_api_screen.dart';
import 'package:getx_api_project/view/post_api/http_post_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostApiHttp(),
    );
  }
}
