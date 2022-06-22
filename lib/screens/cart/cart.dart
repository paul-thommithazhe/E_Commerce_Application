import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/cart_item.dart';
import 'package:take_it_and_go/screens/cart/widgets/item_name_and_description.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        //TODO progress bar cart item
        kHeight10,
        // cart
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade400),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('1 ITEM SELECTED (807)'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                )
              ]),
        ),
        CartItem()
      ]),
    );
  }
}
