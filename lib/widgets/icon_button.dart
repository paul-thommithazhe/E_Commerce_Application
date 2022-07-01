import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtons extends StatelessWidget {
  IconButtons(
      {Key? key,
      required this.buttonFunction,
      required this.icon,
      this.size = 26.0,
      this.iconDataNotFaIcon = true,
      this.paddingSize = 8.0,
      this.iconButtonSize = 24.0})
      : super(key: key);
  final VoidCallback buttonFunction;
  final IconData? icon;
  double size;
  double paddingSize;
  double iconButtonSize;
  bool iconDataNotFaIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: buttonFunction,
      icon: iconDataNotFaIcon ? Icon(icon, size: size) : FaIcon(icon, size: 20),
      iconSize: iconButtonSize,
      padding: EdgeInsets.all(paddingSize),
    );
  }
}
