import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  payementStatus() async {
    await Timer.periodic(Duration(seconds: 5), (timer) {
      Lottie.asset('assets/images/96245-success.json');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/images/96245-success.json');
  }
}
