import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/categories/categories.dart';
import 'package:take_it_and_go/screens/home/home_screen.dart';
import 'package:take_it_and_go/screens/profile/profile.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pages = const [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int pageIndex) {
          setState(() {
            index = pageIndex;
          });
        },
        unselectedItemColor: kBlackColor,
        selectedItemColor: kButtonandBorderColors,
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 10, color: Colors.white),
        unselectedLabelStyle:const TextStyle(
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
            icon: Icon(Icons.list_outlined),
            label: 'CATEGORIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
