import 'package:appp/core/api_povider.dart';
import 'package:appp/model/shop_items.dart';
import 'package:get/get.dart';



class ShopController extends GetxController {
  var products = <ShopItem>[].obs;
  final ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      List<ShopItem> fetchedProducts = await apiProvider.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    }
  }
}