import 'package:fish_hub/app/controllers/home_controller.dart';
import 'package:fish_hub/app/controllers/product_controller.dart'; // Import your ProductController
import 'package:fish_hub/app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  Get.put(ProductController()); // Register ProductController here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
