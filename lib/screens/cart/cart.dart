import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/cart_item.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/coupon/coupon.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(
            buttonFunction: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back),
        title: const Text(
          'SHOPPING BAG',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //TODO progress bar cart item
                const SizedBox(height: 50),
                // cart
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border:
                        Border.all(color: Color.fromARGB(255, 214, 206, 206)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            '1 ITEMS SELECTED (807)',
                            style: TextStyle(color: kBlackColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          )
                        ]),
                  ),
                ),

                const CartItem(),
                const Divider(thickness: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'APPLY COUPON',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButtons(
                          buttonFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CouponScreen()));
                          },
                          icon: Icons.arrow_circle_right)
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromARGB(255, 246, 244, 244),
            child: Center(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        '₹ 807.00',
                        style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserAddressScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: kButtonandBorderColors),
                        child: const Text('PROCEED TO PAYMENT'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
