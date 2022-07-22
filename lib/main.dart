import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      
    );
  }
}
