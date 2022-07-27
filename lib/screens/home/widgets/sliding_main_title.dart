import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/widgets/list_of_product.dart';

// horizontal sliding image with title of the category of the products

class SlidingMainTitle extends StatelessWidget {
  SlidingMainTitle({Key? key}) : super(key: key);

  // List<String> categoryNames = [
  //   'Shirts',
  //   'T-Shirts',
  //   'Trousers',
  //   'Jeans',
  //   'Sports',
  //   'Track Pants',
  //   'Kurtas',
  //   'Blazzers',
  // ];
  // List<String> slidingImages = [
  //   'image1.jpeg',
  //   'image2.jpeg',
  //   'image3.jpeg',
  //   'image4.jpeg',
  //   'image5.jpeg',
  //   'image6.jpeg',
  //   'image6.jpeg',
  // ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: kButtonandBorderColors,
              ),
            );
          }

          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //navigating to list of product items ...(eg :- shirt to list of shirt items)

                        builder: (context) => ListOfProdcutScreen(
                          categoryTitle: snapshot.data!.docs[index]['name'],
                          // productid:snapshot.data!.doc
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: 10,
                          right: 0,
                        ),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data!.docs[index]['image']),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                            // border:
                            //     Border.all(color: kButtonandBorderColors, width: 1.6),
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data!.docs[index]['name'],
                        style: const TextStyle(color: kBlackColor),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
