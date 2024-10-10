import 'package:appp/core/hive.dart';
import 'package:appp/model/shop_items.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  var cartItems = <ShopItem, int>{}.obs;
  Box<CartItem> get cartBox => Hive.box<CartItem>('cartItems');

  @override
  void onInit() {
    super.onInit();
    _loadCartItems();
  }

  void _loadCartItems() {
    for (var cartItem in cartBox.values) {
      cartItems[cartItem.item] = cartItem.quantity;
    }
  }

  double get totalPrice => cartItems.entries.fold(
        0,
        (sum, entry) => sum + (entry.key.price * entry.value),
      );

  void addToCart(ShopItem item) {
    if (cartItems.containsKey(item)) {
      cartItems[item] = cartItems[item]! + 1;
    } else {
      cartItems[item] = 1;
    }
    _saveCartItems();
  }

  void removeFromCart(ShopItem item) {
    if (cartItems.containsKey(item)) {
      if (cartItems[item]! > 1) {
        cartItems[item] = cartItems[item]! - 1;
      } else {
        cartItems.remove(item);
      }
    }
    _saveCartItems();
  }

  void _saveCartItems() {
    cartBox.clear();
    for (var entry in cartItems.entries) {
      cartBox.add(
        CartItem(item: entry.key, quantity: entry.value),
      );
    }
  }
}
