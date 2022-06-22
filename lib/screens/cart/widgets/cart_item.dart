import 'package:flutter/material.dart';
import 'package:take_it_and_go/screens/cart/widgets/item_name_and_description.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              'assets/images/images.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ItemTitleOrDescription(titleOrDecription: 'Louis Philippe'),
              ItemTitleOrDescription(
                  titleOrDecription: 'Men Slim Casual Shirt'),
            ],
          ),
        ],
      ),
    );
  }
}
