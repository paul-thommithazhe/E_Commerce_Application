import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: 60,
      image: NetworkImage('https://adlingo.com/static/img/home/logos/take.png'),
    );
  }
}
