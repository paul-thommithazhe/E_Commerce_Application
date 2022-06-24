import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/payment/payment.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'SHOPPING BAG',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 50),
                const DividerHeadline(
                  dividerHeadLine: 'CONTACT DETAILS',
                ),
                const InputTextFormField(
                  hintTitle: 'Name*',
                ),
                const InputTextFormField(
                  hintTitle: 'Mobile No*',
                ),
                const DividerHeadline(dividerHeadLine: 'ADDRESS'),
                const InputTextFormField(hintTitle: 'Pin Code*'),
                const InputTextFormField(
                    hintTitle: 'Address (House No.Building,Street,Area *'),
                const InputTextFormField(hintTitle: 'Locality/Town*'),
                const DividerHeadline(dividerHeadLine: 'SAVE ADDRESS AS'),
                kHeight10,
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kButtonandBorderColors),
                      ),
                      child: const Text(
                        'Home',
                        style: TextStyle(color: kButtonandBorderColors),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Text(
                        'Work',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                // const Divider(
                //   thickness: 10,
                //   height: 25,
                // ),
              ],
            ),
          ),
          Container(
            height: 60,
            color: Colors.grey.shade400,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kButtonandBorderColors,
                        fixedSize: Size(size.width - 20, 30),
                      ),
                      child: const Text('ADD ADDRESS'),
                    ),
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

class DividerHeadline extends StatelessWidget {
  const DividerHeadline({Key? key, required this.dividerHeadLine})
      : super(key: key);

  final String dividerHeadLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      height: 40,
      color: Colors.grey.shade400,
      child: Text(
        dividerHeadLine,
        style: const TextStyle(color: kBlackColor),
      ),
    );
  }
}

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({Key? key, required this.hintTitle})
      : super(key: key);
  final String hintTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintTitle,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
