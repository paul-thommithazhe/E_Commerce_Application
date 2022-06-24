import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/payment/widgets/paymet_success.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String payment_method = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('PAYMENT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 60),
                const DividerHeadline(dividerHeadLine: 'PAYMENT OPTIONS'),
                kHeight10,
                RadioListTile(
                  value: 'Cash on Delivery',
                  groupValue: payment_method,
                  onChanged: (value) {
                    setState(() {
                      payment_method = value.toString();
                    });
                  },
                  title: Text('Cash on Delivery'),
                ),
                RadioListTile(
                  value: 'Bhim UPI',
                  groupValue: payment_method,
                  onChanged: (value) {
                    setState(() {
                      payment_method = value.toString();
                    });
                  },
                  title: Text('Bhim UPI'),
                ),
              ],
            ),
          ),
         Container(
            color: Colors.grey.shade400,
            height: 55,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '₹ 807.00',
                      style: TextStyle(color: kBlackColor,fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentSuccess()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kButtonandBorderColors,fixedSize: Size(160,40)),
                      child: const Text('PAY NOW'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
