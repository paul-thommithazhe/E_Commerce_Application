import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/model/cart_model/cart_model.dart';
import 'package:take_it_and_go/screens/cart/widgets/cart_item.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

List<CartModel> cartTotalScreen = [];

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    this.title,
    this.size,
    this.brand,
    this.image,
    this.price,
    this.quantity,
  }) : super(key: key);

  final String? title, size, brand, image;
  final int? price, quantity;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  showCouponDialog(context, size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width - 20, 10),
                    primary: kButtonandBorderColors),
                onPressed: () {},
                child: const Text('Apply'),
              )
            ],
          );
        });
  }

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
          'SHOPPING BAG',
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
                            setState(() {
                              
                            });
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
                      showCouponDialog(context, screenSize);
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
                            'Total Amount',
                            style: TextStyle(color: kBlackColor),
                          ),
                          const SizedBox(width: 60),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xffF02052),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UserAddressScreen()),
                              );
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.dollarSign,
                              size: 16,
                            ),
                            label: const Text(
                              'ADDRESS ',
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
