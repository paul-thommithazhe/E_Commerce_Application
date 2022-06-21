import 'package:flutter/material.dart';

// main banner image in the home page

class MainBannerImage extends StatelessWidget {
  const MainBannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 245,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        image: DecorationImage(
          image: AssetImage('assets/images/banner_image3.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
