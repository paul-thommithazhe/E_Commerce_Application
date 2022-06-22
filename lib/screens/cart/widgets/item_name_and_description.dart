import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class ItemTitleOrDescription extends StatelessWidget {
  ItemTitleOrDescription(
      {Key? key, required this.titleOrDecription, this.color = kBlackColor})
      : super(key: key);
  Color? color;
  String titleOrDecription;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleOrDecription,
      style: TextStyle(color: color),
    );
  }
}
