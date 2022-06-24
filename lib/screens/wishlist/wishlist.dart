import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(
          buttonFunction: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
          icon: Icons.arrow_back,
        ),
        title: const Text(
          'Wishlist',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const Text(
            'Your Wishlist is Empty',
            style: TextStyle(
                color: kBlackColor, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          kHeight10,
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Save items that you like in your wihslit.\nReview them anytime and easily move them\n to bag,',
              style: TextStyle(color: kBlackColor),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: kButtonandBorderColors),
                ),
                child: const Text(
                  'Shop Now',
                  style: TextStyle(
                      color: kButtonandBorderColors,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
