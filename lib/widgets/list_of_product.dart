import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/home/widgets/product_lists.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListOfProdcutScreen extends StatelessWidget {
  const ListOfProdcutScreen(
      {Key? key, required this.categoryTitle, required this.productIndex})
      : super(key: key);
  final String categoryTitle;
  final int productIndex;

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
              .where("category", isEqualTo: categoryTitle)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs == null || snapshot.data!.docs.isEmpty) {
              print('no data');
              return const Center(
                child: Text(
                  'No Data Available',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AlignedGridView.count(
                    itemCount: snapshot.data!.docs.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    itemBuilder: (context, index) {
                      return ListItem(
                          imageUrl: snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? const Center(child: CircularProgressIndicator())
                              : snapshot.data!.docs[index]['image'],
                          productTitle: snapshot.data!.docs[index]['name'],
                          productBrand: snapshot.data!.docs[index]['brand'],
                          productPrice: snapshot.data!.docs[index]['price'],
                          productQuantity: snapshot.data!.docs[index]
                              ['quantity'],
                          productId: snapshot.data!.docs[index].id);
                    },
                  ),
                ),
                // IntrinsicHeight(
                //   child: Stack(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Row(
                //             children: [
                //               IconButtons(
                //                 buttonFunction: () {},
                //                 icon: Icons.filter_alt,
                //                 buttonColor:
                //                     const Color.fromARGB(255, 145, 141, 141),
                //               ),
                //               const Text(
                //                 'Sort',
                //                 style: TextStyle(color: kBlackColor),
                //               )
                //             ],
                //           ),
                //           const VerticalDivider(
                //             indent: 10,
                //             endIndent: 10,
                //             thickness: 0.5,
                //             color: Colors.grey,
                //           ),
                //           Row(
                //             children: [
                //               IconButtons(
                //                 buttonFunction: () {},
                //                 icon: Icons.swap_vert,
                //                 buttonColor:
                //                     const Color.fromARGB(255, 145, 141, 141),
                //               ),
                //               const Text(
                //                 'Filter',
                //                 style: TextStyle(color: kBlackColor),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          }),
    );
  }
}
