import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTextFormField(
                hintTitle: 'Enter Coupon',
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CartScreen()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 20),
                    primary: kButtonandBorderColors),
                child: const Text(
                  'APPLY COUPON',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          
        ),

      ),
    );
  }
}
