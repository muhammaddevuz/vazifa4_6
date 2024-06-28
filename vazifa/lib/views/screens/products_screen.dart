import 'package:dars_6/controllers/products_controller.dart';
import 'package:dars_6/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productsController = context.watch<ProductsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahsulotlar'),
      ),
      body: StreamBuilder(
        stream: productsController.list,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return const Center(
              child: Text("Mahsulotlar mavjud emas"),
            );
          }
          final products = snapshot.data!.docs;

          return products.isEmpty
              ? const Center(
                  child: Text("Mahsulotlar mavjud emas"),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: products.length,
                  itemBuilder: (ctx, index) {
                    final product = Product.fromJson(products[index]);
                    return ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text("O'zgartirish"),
                              content: TextField(
                                controller: titleController,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    productsController.editProduct(
                                      product.id,
                                      titleController.text,
                                    );
                                    titleController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("O'ZGARTIRISH"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      title: Text(product.title),
                      subtitle: Text("\$${product.price.toString()}"),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = "Salom";
          double price = 21321;

          productsController.addProduct(title, price);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
