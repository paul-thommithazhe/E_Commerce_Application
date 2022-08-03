import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/payment/payment.dart';

class ListOfAddress extends StatefulWidget {
  ListOfAddress({Key? key, this.productIdValue,})
      : super(key: key);
  String? productIdValue;
  // int? price;
  @override
  State<ListOfAddress> createState() => _ListOfAddressState();
}

class _ListOfAddressState extends State<ListOfAddress> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Select Address",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      )),
      body: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kButtonandBorderColors,
                fixedSize: Size(size.width - 30, 30),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserAddressScreen()));
              },
              child: const Text('Add New Address')),
          kHeight10,
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('address')
                    .where("userid", isEqualTo: auth.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return Flexible(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                            quantity: 1,
                                            productId: widget.productIdValue!,
                                            // price: widget.price!,
                                          )));
                            },
                            selected: true,
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['name'],
                                    style: const TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  kHeight10,
                                  Text(
                                    snapshot.data!.docs[index]['address'],
                                    style: const TextStyle(
                                        color: kBlackColor, fontSize: 14),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['town'],
                                    style: const TextStyle(
                                        color: kBlackColor, fontSize: 14),
                                  ),
                                  Text(
                                    'Kerala ,${snapshot.data!.docs[index]['pin']}',
                                    style: const TextStyle(
                                        color: kBlackColor, fontSize: 14),
                                  ),
                                  kHeight10,
                                  Row(
                                    children: [
                                      const Text(
                                        'Mobile:',
                                        style: TextStyle(color: kBlackColor),
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['mobile'],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 109, 104, 104),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class UserAddressScreen extends StatelessWidget {
  UserAddressScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController townController = TextEditingController();

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
                kHeight10,
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name*'),
                ),
                kHeight10,
                TextFormField(
                  controller: mobileController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile No*',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                kHeight10,
                const DividerHeadline(dividerHeadLine: 'ADDRESS'),
                kHeight10,
                TextFormField(
                  controller: pincodeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Pin Code*'),
                  keyboardType: TextInputType.number,
                ),
                kHeight10,
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Address (House No.Building,Street,Area *'),
                ),
                kHeight10,
                TextFormField(
                    controller: townController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Locality/Town*')),
                kHeight10,
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
              ],
            ),
          ),
          Container(
            height: 60,
            color: const Color.fromARGB(255, 246, 244, 244),
            child: Center(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Map<String, dynamic> data = {
                            'name': nameController.text,
                            'mobile': mobileController.text,
                            'pin': pincodeController.text,
                            'address': addressController.text,
                            'town': townController.text,
                            'userid': auth.currentUser!.uid
                          };
                          FirebaseFirestore.instance
                              .collection('address')
                              .doc()
                              .set(data);
                          nameController.clear();
                          mobileController.clear();
                          pincodeController.clear();
                          addressController.clear();
                          townController.clear();

                          Navigator.push(
                            context,
                            //payment screen
                            MaterialPageRoute(
                              builder: (context) => ListOfAddress(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kButtonandBorderColors,
                          fixedSize: Size(size.width - 20, 30),
                        ),
                        child: const Text(
                          'ADD ADDRESS',
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
  InputTextFormField(
      {Key? key,
      required this.hintTitle,
      this.textInputType = TextInputType.name,
      this.paddingHorizontal = 12.0,
      this.paddingVertical = 8.0})
      : super(key: key);
  final String hintTitle;
  TextInputType textInputType;
  double paddingHorizontal;
  double paddingVertical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: TextFormField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintTitle,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
