import 'package:flutter/material.dart';

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width / 1.75 ,
      child: Column(children: [
        Row(children: [
          
        ],)
      ]),
    );
  }
}
