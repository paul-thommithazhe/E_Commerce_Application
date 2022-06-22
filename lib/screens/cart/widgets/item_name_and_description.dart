import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class ItemTitleOrDescription extends StatelessWidget {
  ItemTitleOrDescription({Key? key, required this.titleOrDecription})
      : super(key: key);
  String titleOrDecription;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleOrDecription,
      style: const TextStyle(color: kBlackColor),
    );
  }
}
