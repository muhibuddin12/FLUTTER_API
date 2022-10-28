import 'package:flutter_api/models/product.dart';
import 'package:flutter_api/services/remote_services.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
