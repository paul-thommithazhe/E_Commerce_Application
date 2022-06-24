import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  IconButtons(
      {Key? key,
      required this.buttonFunction,
      required this.icon,
      this.size = 26.0})
      : super(key: key);
  final VoidCallback buttonFunction;
  final IconData icon;
  double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: buttonFunction,
      icon: Icon(icon, size: size),
    );
  }
}
