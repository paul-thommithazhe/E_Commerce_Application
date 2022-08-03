import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/model/cart_model/cart_model.dart';
import 'package:take_it_and_go/screens/cart/widgets/cart_item.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

List<CartModel> cartTotalScreen = [];

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
    this.title,
    this.size,
    this.brand,
    this.image,
    this.price,
    this.quantity,
    this.productId,
  }) : super(key: key);

  final String? title, size, brand, image, productId;
  final int? price, quantity;
  TextEditingController couponController = TextEditingController();
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(
            buttonFunction: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back),
        title: const Text(
          'SHOPPING CART',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: cartTotalScreen.isEmpty
          ? Center(
              child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: kButtonandBorderColors),
              child: const Text('Cart is Empty ! Keep Shopping'),
            ))
          : Column(
              children: [
                Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border: Border.all(
                        color: const Color.fromARGB(255, 214, 206, 206)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${cartTotalScreen.length} ITEMS SELECTED (807)',
                          style: const TextStyle(color: kBlackColor),
                        ),
                        IconButton(
                          onPressed: () {
                            cartTotalScreen.clear();
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartTotalScreen.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                            title: cartTotalScreen[index].productName,
                            size: cartTotalScreen[index].size,
                            brand: cartTotalScreen[index].brand,
                            image: cartTotalScreen[index].image,
                            price: cartTotalScreen[index].price,
                            quantity: cartTotalScreen[index].quantity);
                      }),
                ),
                const Divider(thickness: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Enter Coupon",
                              style: TextStyle(color: kBlackColor),
                            ),
                            content: TextFormField(
                              controller: widget.couponController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.pink),
                                  onPressed: () {},
                                  child: const Text(
                                    'Apply',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text(
                              'APPLY COUPON',
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_circle_right)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(77, 227, 217, 217))),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            ' Rs. 807',
                            style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(width: 60),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kButtonandBorderColors,
                                fixedSize: const Size(150, 30)),
                            onPressed: () {
                              if (auth.currentUser!.uid.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListOfAddress(
                                      productIdValue: widget.productId!,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              'PLACE ORDER',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
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
