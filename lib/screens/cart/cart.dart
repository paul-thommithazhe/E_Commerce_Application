import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/cart_item.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(buttonFunction: () {}, icon: Icons.arrow_back),
        title: const Text('Shopping Bag'),
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
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            '1 ITEM SELECTED (807)',
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
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade400,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '₹ 807.00',
                      style: TextStyle(color: kBlackColor),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserAddressScreen()),
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
          )
        ],
      ),
    );
  }
}
