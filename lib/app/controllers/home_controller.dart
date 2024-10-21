import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<int> productIds = <int>[1, 2, 3, 4, 5].obs;

  void addProduct(int productId) {
    productIds.add(productId);
  }

  void removeProduct(int productId) {
    productIds.remove(productId);
  }

  void searchProduct(String query) {
  }
}
