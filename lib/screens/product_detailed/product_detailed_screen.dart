import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/cart/cart.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/product_detailed/widgets/size_container.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ProductDetailedScreen extends StatelessWidget {
  ProductDetailedScreen({Key? key}) : super(key: key);
  //dummy product sizes ......
  final List<String> size = ['S', 'M', 'L', 'XL'];

  // Stream<QuerySnapshot<Map<String, dynamic>>> getData() async{
  //   data = await FirebaseFirestore.instance.collection('category').get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            'Brand Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButtons(
              buttonFunction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: FontAwesomeIcons.bagShopping,
              iconDataNotFaIcon: false,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 455,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/detailed_image.jpeg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        kHeight10,
                        const Text(
                          'Dennis Lingo Men Pink Slim Fit Casual Shirt',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 18,
                          ),
                        ),
                        kHeight10,
                        const Text(
                          '₹ 1299',
                          style: TextStyle(
                              color: kBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select Size',
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: ListView.separated(
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(width: 8)),
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    ProductSizeContainer(
                                  productSize: size[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(77, 227, 217, 217))),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserAddressScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Row(
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(),
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_outline,
                                  color: kBlackColor),
                              label: const Text(
                                'WISHLIST',
                                style:
                                    TextStyle(color: kBlackColor, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffF02052),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserAddressScreen()),
                          );
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.bagShopping,
                          size: 16,
                        ),
                        label: const Text(
                          'BUY NOW',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
