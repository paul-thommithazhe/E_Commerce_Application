import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(image),
        ),
        Text(
          title,
          style: const TextStyle(color: kBlackColor),
        )
      ],
    );
  }
}
