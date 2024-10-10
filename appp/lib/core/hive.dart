import 'package:appp/model/shop_items.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final ShopItem item;

  @HiveField(1)
  final int quantity;

  CartItem({required this.item, required this.quantity});
}

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 1;

  @override
  CartItem read(BinaryReader reader) {
    final item = reader.read() as ShopItem;
    final quantity = reader.read() as int;
    return CartItem(item: item, quantity: quantity);
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.write(obj.item);
    writer.write(obj.quantity);
  }
}
