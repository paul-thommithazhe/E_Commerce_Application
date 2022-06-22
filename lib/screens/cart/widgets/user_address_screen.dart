import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(('SHOPPING BAG')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 30,
                  color: Colors.grey.shade400,
                  child: const Text(
                    'CONTACT DETAILS',
                    style: TextStyle(color: kBlackColor),
                  ),
                ),
                const InputTextFormField(
                  hintTitle: 'Name',
                ),
                const InputTextFormField(
                  hintTitle: 'Mobile No',
                ),
              ],
            ),
          ),
        ],
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
        decoration:
            InputDecoration(hintText: hintTitle, border: OutlineInputBorder()),
      ),
    );
  }
}
