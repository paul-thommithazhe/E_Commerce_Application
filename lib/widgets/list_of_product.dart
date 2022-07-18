import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/home/widgets/product_lists.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListOfProdcutScreen extends StatelessWidget {
  const ListOfProdcutScreen({Key? key, required this.categoryTitle})
      : super(key: key);
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          leading: IconButtons(
            icon: Icons.arrow_back,
            buttonFunction: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          title: Text(
            categoryTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('products')
                .doc()
                .collection(categoryTitle)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            ListItem(),
                            ListItem(),
                          ],
                        ),
                        Row(
                          children: [
                            ListItem(),
                            ListItem(),
                          ],
                        ),
                        Row(
                          children: [
                            ListItem(),
                            ListItem(),
                          ],
                        ),
                        Row(
                          children: [
                            ListItem(),
                            ListItem(),
                          ],
                        ),
                        Row(
                          children: [
                            ListItem(),
                            ListItem(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                IconButtons(
                                  buttonFunction: () {},
                                  icon: Icons.filter_alt,
                                  buttonColor:
                                      const Color.fromARGB(255, 145, 141, 141),
                                ),
                                const Text(
                                  'Sort',
                                  style: TextStyle(color: kBlackColor),
                                )
                              ],
                            ),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                IconButtons(
                                    buttonFunction: () {},
                                    icon: Icons.swap_vert,
                                    buttonColor: const Color.fromARGB(
                                        255, 145, 141, 141)),
                                const Text(
                                  'Filter',
                                  style: TextStyle(color: kBlackColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
