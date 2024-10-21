import 'package:fish_hub/app/controllers/product_controller.dart'; // Import ProductController
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish_hub/app/widgets/carousals.dart';
import 'package:fish_hub/app/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find(); // Access ProductController

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.redAccent[700],
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  Text(
                    'WhiteField, Bangalore',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        onChanged: (value) {
                          // Optionally call a search method if implemented
                        },
                        decoration: InputDecoration(
                          hintText: 'Type fish name to search',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: Colors.redAccent[700]),
                            onPressed: () {}, // Implement search functionality
                          ),
                        ),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.redAccent[700],
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Carousals(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Grand Offer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
                  height: 220,
                  child: Obx(() {
                    // Using the ProductController to get products
                    if (productController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (productController.errorMessage.isNotEmpty) {
                      return Center(child: Text(productController.errorMessage.value));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 300, // Width of each product card
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ProductCard(productId: productController.products[index].id),
                          );
                        },
                      );
                    }
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset('assets/carousal_2.png'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset('assets/carousal_3.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
