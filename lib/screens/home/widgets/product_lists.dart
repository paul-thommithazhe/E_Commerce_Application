import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/product_detailed/product_detailed_screen.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            //navigating to product detailed page

            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailedScreen()));
            },
            child: Container(
              height: 220,
              width: size.width / 2.2,
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage('assets/images/shirt.webp'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Louis Philippe',
                  style: TextStyle(color: kBlackColor),
                ),
                kWidth20,
                IconButtons(
                  buttonFunction: () {},
                  icon: Icons.favorite,
                  
                  iconButtonSize: 15,
                  size: 22,
                  paddingSize: 0,
                  buttonColor: kGreyColor,
                )
              ],
            ),
          ),
          const Text(
            'Men Slim Fit Casual Shirt',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const Text(
            '₹ 2,399',
            style: TextStyle(color: kBlackColor),
          )
        ],
      ),
    );
  }
}
