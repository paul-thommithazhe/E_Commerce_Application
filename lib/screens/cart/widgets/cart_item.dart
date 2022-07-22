import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/item_name_and_description.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.title,
    required this.size,
    required this.brand,
    required this.image,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  final String title, size, brand, image;
  final int price, quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        height: 195,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 230, 223, 223),
          ),
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
                  child: Image(
                    image: NetworkImage(image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemTitleOrDescription(titleOrDecription: brand),
                    ItemTitleOrDescription(
                      titleOrDecription: title,
                      color: Colors.grey,
                    ),
                    kHeight10,
                    Container(
                      height: 30,
                      width: 70,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: Text(
                        'Size : $size',
                        style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    kHeight10,
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          padding: const EdgeInsets.all(5),
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: Text(
                            'Qty : $quantity',
                            style: const TextStyle(
                                color: kBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        kWidth20,
                        ElevatedButton(
                          onPressed: quantity == 1 ? null : () {},
                          style: ElevatedButton.styleFrom(
                              primary: kButtonandBorderColors,
                              shape: const CircleBorder()),
                          child: const Icon(Icons.remove),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: kButtonandBorderColors,
                                shape: const CircleBorder()),
                            child: const Icon(Icons.add))
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 222, 214, 214),
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
