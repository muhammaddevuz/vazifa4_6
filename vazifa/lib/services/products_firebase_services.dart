import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsFirebaseServices {
  final _productCollection = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot> getProducts() async* {
    yield* _productCollection.snapshots();
  }

  void addProduct(String title, double price) {
    _productCollection.add({
      "title": title,
      "price": price,
    });
  }

  void editProduct(String id, String title) {
    _productCollection.doc(id).update({
      "title": title,
    });
  }
}
