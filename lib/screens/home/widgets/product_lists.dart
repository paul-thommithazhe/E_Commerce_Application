import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/product_detailed/product_detailed_screen.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.imageUrl,
    required this.productTitle,
    required this.productBrand,
    required this.productPrice,
  }) : super(key: key);
  final String imageUrl;
  final String productTitle;
  final String productBrand;
  final int productPrice;

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
                  builder: (context) => ProductDetailedScreen(
                    imageUrl: imageUrl,
                    name: productTitle,
                    brand: productBrand,
                    price: productPrice,
                  ),
                ),
              );
            },
            child: Hero(
              tag: productTitle,
              child: Container(
                height: 210,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  productBrand.toUpperCase(),
                  style: const TextStyle(
                      color: kBlackColor, fontWeight: FontWeight.w400),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                SizedBox(
                  width: 20,
                  child: IconButtons(
                    buttonFunction: () {},
                    icon: Icons.favorite,
                    iconButtonSize: 15,
                    size: 22,
                    paddingSize: 0,
                    buttonColor: kGreyColor,
                  ),
                )
              ],
            ),
          ),
          Text(
            productTitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            '₹${productPrice.toString()}',
            style: const TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
