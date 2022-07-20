import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ProductData extends ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>> getProductData(value) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc()
        .collection(value)
        .snapshots();
  }
}
