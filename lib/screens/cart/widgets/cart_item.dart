import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/item_name_and_description.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(top: 15),
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
                const SizedBox(
                    height: 90,
                    width: 90,
                    child: Image(
                      image: NetworkImage(
                          'https://assets.myntassets.com/f_webp,dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/1364628/2016/8/31/11472636737718-Roadster-Men-Blue-Regular-Fit-Printed-Casual-Shirt-6121472636737160-1.jpg'),
                    )),
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
