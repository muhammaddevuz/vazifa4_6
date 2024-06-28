import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String title;
  num price;

  Product({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Product.fromJson(QueryDocumentSnapshot query) {
    return Product(
      id: query.id,
      title: query['title'],
      price: query['price'],
    );
  }
}
