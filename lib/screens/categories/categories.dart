import 'package:flutter/material.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/categories/widgets/category_item.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(
            icon: Icons.arrow_back,
            buttonFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
        title: const Text(
          'CATEGORY ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CategoryItem(title: 'Shirts'),
              SizedBox(width: 30),
              CategoryItem(title: 'T-Shirts'),
              SizedBox(width: 30),
              CategoryItem(title: 'Jeans'),
            ],
          ),
        ],
      ),
    );
  }
}
