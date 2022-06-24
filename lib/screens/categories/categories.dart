import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
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
              CategoryItem(title:'Jeans'),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://stylesatlife.com/wp-content/uploads/2021/06/Rohit-Khandelwal.jpg.webp'),
        ),
        Text(
          title,
          style:const TextStyle(color: kBlackColor),
        )
      ],
    );
  }
}
