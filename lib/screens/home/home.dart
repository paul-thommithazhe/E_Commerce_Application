import 'package:flutter/material.dart';
import 'package:take_it_and_go/screens/home/widgets/bottom_widget.dart';
import 'package:take_it_and_go/screens/home/widgets/drawer.dart';
import 'package:take_it_and_go/screens/home/widgets/head_lining_brands.dart';
import 'package:take_it_and_go/screens/home/widgets/main_banner_image.dart';
import 'package:take_it_and_go/screens/home/widgets/most_loved_brands.dart';
import 'package:take_it_and_go/screens/home/widgets/sliding_main_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerHomePage(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Take it & go',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'Dancing Script'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          //horizontal slidig image
          const SlidingMainTitle(),
          //main banner image
          const MainBannerImage(),
          //headlining brands
          HeadLiningBrands(),
          //most loved brands
          MostLovedBrands()
        ],
      ),
      bottomNavigationBar: const BottomWidget(),
    );
  }
}
