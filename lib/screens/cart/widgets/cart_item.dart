import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/item_name_and_description.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    'assets/images/images.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemTitleOrDescription(titleOrDecription: 'Louis Philippe'),
                    ItemTitleOrDescription(
                      titleOrDecription: 'Men Slim Casual Shirt',
                      color: Colors.grey,
                    ),
                    kHeight10,
                    Container(
                      height: 30,
                      width: 60,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: const Text(
                        'Size : S',
                        style: TextStyle(
                            color: kBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    kHeight10,
                    Container(
                      height: 30,
                      width: 60,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: const Text(
                        'Qty : 1',
                        style: TextStyle(
                            color: kBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 8.0),
              child: GestureDetector(
                child: const Text(
                  'Remove',
                  style: TextStyle(color: kBlackColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
