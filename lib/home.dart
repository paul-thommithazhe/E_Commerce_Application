import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/categories/categories.dart';
import 'package:take_it_and_go/screens/home/home_screen.dart';
import 'package:take_it_and_go/screens/profile/profile.dart';
import 'package:take_it_and_go/screens/wishlist/wishlist.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool cartScreen = false;

class _HomeState extends State<Home> {
  final pages = const [
    HomeScreen(),
    CategoryScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: index == 3
          ? null
          : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              onTap: (int pageIndex) {
                setState(() {
                  index = pageIndex;
                });
              },
              unselectedItemColor: kBlackColor,
              selectedItemColor: kButtonandBorderColors,
              selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 9,
                color: kBlackColor,
              ),
              currentIndex: index,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.list,size: 20,),
                  label: 'CATEGORIES',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart,size: 20),
                  label: 'WISHLIST',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bagShopping,size: 20),
                  label: 'CART',
                  
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user,size: 20),
                  label: 'PROFILE',
                ),
              ],
            ),
    );
  }
}
