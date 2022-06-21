import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          titleTextStyle: TextStyle(color: kBlackColor),
          iconTheme: IconThemeData(color: kBlackColor),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(color: kBlackColor),
          headline2: TextStyle(color: Colors.yellow),
          bodyText1: TextStyle(color: Colors.red),
          subtitle1: TextStyle(color: kBlackColor),
        ),
        iconTheme: const IconThemeData(color: kBlackColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: kBlackColor,
            selectedItemColor: kBlackColor,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w500, fontSize: 10)),
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
