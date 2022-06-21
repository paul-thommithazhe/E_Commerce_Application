import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
// most loved brands banner images

class MostLovedBrands extends StatelessWidget {
  const MostLovedBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              style: TextStyle(color: kBlackColor,fontWeight: FontWeight.w900,fontSize: 20),
            ),
          ),
          kHeight10,
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration:const Duration(seconds: 2),
              height: 100.0,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage('assets/images/blackberrys.webp'),
                          fit: BoxFit.contain),
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

// class LovedBrandsBanner extends StatelessWidget {
//   const LovedBrandsBanner({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       decoration:
//           const BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
//     );
//   }
// }
