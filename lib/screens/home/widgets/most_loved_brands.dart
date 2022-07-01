import 'package:carousel_slider/carousel_slider.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              height: 200.0,
            ),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage(bannerImagesName[i - 1]),
                          fit: BoxFit.fitWidth),
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
