import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class ProductSizeContainer extends StatelessWidget {
  ProductSizeContainer({
    Key? key,
    required this.productSize,
    required this.color,
  }) : super(key: key);
  String productSize;
  Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        productSize,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
