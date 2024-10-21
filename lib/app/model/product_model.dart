import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String price;
  final String image;
  final String description;
  final String storageInstructions;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.storageInstructions,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      storageInstructions: json['storage_instructions'],
    );
  }

  String getFullImageUrl() {
    return "https://ourworks.co.in/sigofish-backend/public/$image";
  }

  // Adjusted to parse a single product
  static ProductModel fromResponse(String response) {
    final data = jsonDecode(response);
    final productData = data['data']['product'];
    return ProductModel.fromJson(productData);
  }

  // New method to parse a list of products from a response
  static List<ProductModel> fromListResponse(String response) {
    final data = jsonDecode(response);
    final productsList = data['data']['products'] as List; // Assuming 'products' is the key for the list
    return productsList.map((productJson) => ProductModel.fromJson(productJson)).toList();
  }
}
