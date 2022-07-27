import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/model/cart_model/cart_model.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/login/login.dart';
import 'package:take_it_and_go/screens/product_detailed/widgets/size_container.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ProductDetailedScreen extends StatefulWidget {
  ProductDetailedScreen({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.brand,
    required this.price,
    required this.quantity,
  }) : super(key: key);
  final String name, brand, imageUrl;
  final int price;
  int quantity;

  @override
  State<ProductDetailedScreen> createState() => _ProductDetailedScreenState();
}

class _ProductDetailedScreenState extends State<ProductDetailedScreen> {
  //dummy product sizes ......
  final List<String> size = ['S', 'M', 'L', 'XL'];

  int _selectedIndex = 0;

  String? productNameFromList, productSizeFromList;
  int productQ = 0;

  snackBarShow(String text) {
    const SnackBar(
      content: Text('Already Product Added'),
      backgroundColor: kBlackColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            widget.brand.toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButtons(
              buttonFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: FontAwesomeIcons.bagShopping,
              iconDataNotFaIcon: false,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.name,
                          child: Container(
                            width: double.infinity,
                            height: 455,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.imageUrl),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        kHeight10,
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 18,
                          ),
                        ),
                        kHeight10,
                        Text(
                          '₹ ${widget.price.toString()}',
                          style: const TextStyle(
                              color: kBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select Size',
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: ListView.separated(
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(width: 8)),
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });

                                    print(size[_selectedIndex]);
                                    log(size[index]);

                                    // if(size[index].isSelected)
                                  },
                                  child: ProductSizeContainer(
                                    productSize: size[index],
                                    color: _selectedIndex == index
                                        ? kButtonandBorderColors
                                        : kGreyColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserAddressScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Row(
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(),
                              onPressed: () {
                                print(
                                    cartTotalScreen.map((e) => print(e.size)));
                                if (cartTotalScreen.isEmpty) {
                                  print('empty');
                                  cartTotalScreen.add(
                                    CartModel(
                                      productName: widget.name,
                                      brand: widget.brand,
                                      size: size[_selectedIndex],
                                      image: widget.imageUrl,
                                      price: widget.price,
                                      quantity: 1,
                                    ),
                                  );
                                } else {
                                  for (int i = 0;
                                      i < cartTotalScreen.length;
                                      i++) {
                                    productNameFromList =
                                        cartTotalScreen[i].productName;

                                    productSizeFromList =
                                        cartTotalScreen[i].size;

                                    if (widget.name ==
                                            cartTotalScreen[i].productName &&
                                        size[_selectedIndex] ==
                                            cartTotalScreen[i].size) {
                                      break;
                                    } else if (widget.name ==
                                            cartTotalScreen[i].productName &&
                                        size[_selectedIndex] !=
                                            cartTotalScreen[i].size) {
                                      print('size different');
                                      cartTotalScreen.add(
                                        CartModel(
                                          productName: widget.name,
                                          brand: widget.brand,
                                          size: size[_selectedIndex],
                                          image: widget.imageUrl,
                                          price: widget.price,
                                          quantity: 1,
                                        ),
                                      );
                                      break;
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.shopify_outlined,
                                  color: kBlackColor),
                              label: const Text(
                                'ADD TO CART',
                                style:
                                    TextStyle(color: kBlackColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffF02052),
                          ),
                        ),
                        onPressed: () {
                          if (auth.currentUser != null) {
                            widget.quantity == 0
                                ? null
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListOfAddress(),
                                    ),
                                  );
                          } else {
                            log('pleasae login first');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        },
                        icon: widget.quantity == 0
                            ? const SizedBox()
                            : const FaIcon(
                                FontAwesomeIcons.bagShopping,
                                size: 16,
                              ),
                        label: widget.quantity == 0
                            ? const Text(
                                'OUT OF STOCK',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : const Text(
                                'BUY NOW',
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
        ));
  }
}
