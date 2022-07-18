import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModal {
  ProductModal({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    required this.price,
    this.offer = 0,
  });

  String id, brand, name, image;
  int price;
  double offer;
}
