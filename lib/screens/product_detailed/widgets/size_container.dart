import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class ProductSizeContainer extends StatelessWidget {
  ProductSizeContainer({Key? key, required this.productSize}) : super(key: key);
  String productSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kGreyColor,
      child: Text(
        productSize,
        style: const TextStyle(color: kBlackColor),
      ),
    );
  }
}
