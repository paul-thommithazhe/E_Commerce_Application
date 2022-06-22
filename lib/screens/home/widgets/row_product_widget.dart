import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:take_it_and_go/screens/home/widgets/product_lists.dart';

// product in horizontal direction

class RowProductWidget extends StatelessWidget {
  const RowProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        ListItem(),
        ListItem(),
      ],
    );
  }
}
