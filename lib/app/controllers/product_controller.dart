import 'package:get/get.dart';
import 'package:fish_hub/app/model/product_model.dart'; // Ensure this matches your project structure
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var products = <ProductModel>[].obs; // Observable list of products
  var isLoading = true.obs; // Loading state
  var errorMessage = ''.obs; // Error message state

  @override
  void onInit() {
    fetchProducts(); // Fetch products when the controller is initialized
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true; // Set loading to true
      final response = await http.get(Uri.parse('https://ourworks.co.in/sigofish-backend/public/customer/products'));

      if (response.statusCode == 200) {
        products.value = ProductModel.fromListResponse(response.body); // Populate the observable list
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      errorMessage.value = e.toString(); // Capture error message
    } finally {
      isLoading.value = false; // Set loading to false after fetching
    }
  }

  // Optionally, you can add a method to fetch a single product as before
  Future<ProductModel?> fetchProduct(int productId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://ourworks.co.in/sigofish-backend/public/customer/products/details?product_id=$productId&store_id=1'));

      if (response.statusCode == 200) {
        return ProductModel.fromResponse(response.body);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      return null; // Return null if there's an error
    }
  }
}
