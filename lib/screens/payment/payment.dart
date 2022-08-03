import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/payment/widgets/paymet_success.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key, required this.productId, required this.quantity})
      : super(key: key);
  String productId;
  int price = 500;
  int quantity;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String payment_method = '';

  // razorPayPayment() {

  //   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                  title: const Text('Cash on Delivery'),
                ),
                RadioListTile(
                  value: 'Bhim UPI',
                  groupValue: payment_method,
                  onChanged: (value) {
                    setState(() {
                      payment_method = value.toString();
                    });
                  },
                  title: const Text('Bhim UPI'),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 246, 244, 244),
            height: 55,
            child: Center(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        '₹ 807.00',
                        style: TextStyle(
                            color: kBlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //get the cart details and add to product value to the firebase and decrement the counter of stock
                          //

                          int? stockQuantity;
                          var collection =
                              FirebaseFirestore.instance.collection('products');
                          var docSnapshot =
                              await collection.doc(widget.productId).get();
                          if (docSnapshot.exists) {
                            Map<String, dynamic>? dataValue =
                                docSnapshot.data();
                            var value = dataValue?[
                                'quantity']; // <-- The value you want to retrieve.

                            setState(() {
                              stockQuantity = value;
                            });
                          }
                          int finalQuantity = stockQuantity! - widget.quantity;

                          print(
                              '=================================================');
                          Map<String, dynamic> updatedData = {
                            'quantity': finalQuantity
                          };

                          FirebaseFirestore.instance
                              .collection('products')
                              .doc(widget.productId)
                              .update(updatedData);
                          // get current id and product id and store it in the database
                          Map<String, dynamic> data = {
                            'productid': widget.productId,
                            'userid': auth.currentUser!.uid
                          };

                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc()
                              .set(data);

                          Navigator.push(
                            context,
                            // if payment success it will direct to paymentsuccess page.........
                            MaterialPageRoute(
                                builder: (context) => const PaymentSuccess()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: kButtonandBorderColors,
                            fixedSize: const Size(160, 25)),
                        child: const Text(
                          'PAY NOW',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


// class PaymentStrip extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           CardField(
//             onCardChanged: (card) {
//               print(card);
//             },
//           ),
//           TextButton(
//             onPressed: () async {
//               // create payment method
//               final paymentMethod =
//                   await Stripe.instance.createPaymentMethod(PaymentMethodParams.card(paymentMethodData: ));
//             },
//             child: Text('pay'),
//           )
//         ],
//       ),
//     );
//   }
// }