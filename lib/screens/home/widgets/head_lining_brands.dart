import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class HeadLiningBrands extends StatelessWidget {
  const HeadLiningBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'HEADLINING BRANDS',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          kHeight10,
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const BrandsBannerImages();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BrandsBannerImages extends StatelessWidget {
  const BrandsBannerImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            image: NetworkImage(
                'https://assets.myntassets.com/f_webp,dpr_1.5,q_auto:eco,w_600,c_limit,fl_progressive/assets/images/retaillabs/2022/4/8/aa8037d7-1a7d-43c2-9319-c0892ba131981649429421021-TheSummerShop-HotRightNow-Men.gif'),
            fit: BoxFit.cover),
      ),
    );
  }
}
