import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
// most loved brands banner images

class MostLovedBrands extends StatelessWidget {
  MostLovedBrands({Key? key}) : super(key: key);

  // list of most loved brands banner images

  final List<String> bannerImagesName = [
    'assets/images/denimMen_banner.jpeg',
    'assets/images/shirtwear.jpeg',
    'assets/images/workWearMen.jpeg'
  ];
  int? index = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('most loved brands')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: kButtonandBorderColors,
              ),
            );
          }
          // return Text(snapshot.data!.docs[0]['image1'],style: TextStyle(color: kBlackColor),);
          return SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              kHeight10,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'MOST LOVED BRANDS',
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              kHeight10,
              SizedBox(
                height: 200,
                child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      height: 200.0,
                    ),
                    items: [0].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data!.docs[0]['image$index']),
                                  fit: BoxFit.fitWidth),
                            ),
                          );
                        },
                      );
                    }).toList()),
              ),
            ]),
          );
        });
  }
}
