import 'package:flutter/material.dart';

class CartModel {
  CartModel({
    required this.productName,
    required this.brand,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
  });
  String productName, brand, size, image;
  int price,quantity;
}
