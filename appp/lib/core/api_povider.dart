import 'dart:convert';
import 'package:appp/model/shop_items.dart';
import 'package:http/http.dart' as http;


class ApiProvider {
  final String _baseUrl = 'https://fakestoreapi.com/products';
  Future<List<ShopItem>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((item) => ShopItem(
                id: item['id'],
                title: item['title'],
                price: item['price'].toDouble(),
                description: item['description'],
                category: item['category'],
                image: item['image'],
                rating: Rating(
                  rate: item['rating']['rate'].toDouble(),
                  count: item['rating']['count'],
                ),
              ))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}