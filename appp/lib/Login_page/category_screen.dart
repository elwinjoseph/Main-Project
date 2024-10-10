import 'package:appp/Login_page/product_detail.dart';
import 'package:appp/controller/cart_controller.dart';
import 'package:appp/controller/shop_controller.dart';
import 'package:appp/model/shop_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  ScreenCategoryState createState() => ScreenCategoryState();
}

class ScreenCategoryState extends State<ScreenCategory> {
  final ShopController shopController = Get.put(ShopController());
  final CartController cartController = Get.put(CartController());

  String selectedCategory = 'All Products';

  // List of categories
  final List<Map<String, String>> categories = [
    {'label': 'Mens Clothing', 'value': 'men\'s clothing'},
    {'label': 'Womens Clothing', 'value': 'women\'s clothing'},
    {'label': 'Jewelry', 'value': 'jewelery'},
    {'label': 'Electronics', 'value': 'electronics'},
    {'label': 'All Products', 'value': 'All Products'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String label = categories[index]['label']!;
                  String category = categories[index]['value']!;
                  return _buildCustomCategoryChip(label, category);
                },
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (shopController.products.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              List<ShopItem> filteredProducts = shopController.products;
              if (selectedCategory != 'All Products') {
                filteredProducts = shopController.products
                    .where((product) =>
                        product.category.toLowerCase() ==
                        selectedCategory.toLowerCase())
                    .toList();
              }

              if (filteredProducts.isEmpty) {
                return const Center(child: Text('No products available.'));
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    ShopItem product = filteredProducts[index];
                    return Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ScreenProductDetails(product: product));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 97,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '\$${product.price.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // Custom category chip with better design
  Widget _buildCustomCategoryChip(String label, String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: selectedCategory == category ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              // You can add icons before the label if needed
              // Icon(Icons.category, color: selectedCategory == category ? Colors.white : Colors.black),
              Text(
                label,
                style: TextStyle(
                  color: selectedCategory == category
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
