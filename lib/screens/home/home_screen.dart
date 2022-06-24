import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/home/widgets/drawer.dart';
import 'package:take_it_and_go/screens/home/widgets/head_lining_brands.dart';
import 'package:take_it_and_go/screens/home/widgets/main_banner_image.dart';
import 'package:take_it_and_go/screens/home/widgets/main_logo.dart';
import 'package:take_it_and_go/screens/home/widgets/most_loved_brands.dart';
import 'package:take_it_and_go/screens/home/widgets/sliding_main_title.dart';
import 'package:take_it_and_go/screens/search/search_screen.dart';
import 'package:take_it_and_go/screens/wishlist/wishlist.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerHomePage(),
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Take it & Go',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'Dancing Script'),
        ),
        actions: [
          IconButtons(
            buttonFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: Icons.search,
          ),
        ],
      ),
      body: ListView(
        children: const [
          //sliding categories
          SlidingMainTitle(),
          //main banner
          MainBannerImage(),
          //Headlining brands
          HeadLiningBrands(),
          //most loved brands
          MostLovedBrands()
        ],
      ),
    );
  }
}
