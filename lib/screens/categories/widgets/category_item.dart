import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

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
