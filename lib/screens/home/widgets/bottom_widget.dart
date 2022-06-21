import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(color: kBlackColor),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined), label: 'CATEGORIES'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'WISHLIT'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_mall_outlined), label: 'CART'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'PROFILE'),
      ],
    );
  }
}
