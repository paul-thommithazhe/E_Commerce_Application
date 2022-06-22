import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons(
      {Key? key, required this.buttonFunction, required this.icon})
      : super(key: key);
  final VoidCallback buttonFunction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: buttonFunction,
      icon: Icon(icon),
    );
  }
}
