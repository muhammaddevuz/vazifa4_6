import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dars_6/services/products_firebase_services.dart';
import 'package:flutter/material.dart';

class ProductsController extends ChangeNotifier {
  final _productsFirebaseServices = ProductsFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _productsFirebaseServices.getProducts();
  }

  void addProduct(String title, double price) {
    _productsFirebaseServices.addProduct(title, price);
  }

  void editProduct(String id, String title) {
    _productsFirebaseServices.editProduct(id, title);
    
  }
}
