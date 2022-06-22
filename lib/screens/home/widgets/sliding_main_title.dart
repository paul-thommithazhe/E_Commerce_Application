import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/widgets/list_of_product.dart';

// horizontal sliding image with title of the category of the products

class SlidingMainTitle extends StatelessWidget {
  const SlidingMainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListOfProdcutScreen(
                    categoryTitle: 'Shirts',
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 10,
                    right: 0,
                  ),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/images.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: kButtonandBorderColors, width: 1.6),
                    ),
                  ),
                ),
                const Text(
                  'shirts',
                  style: TextStyle(color: kBlackColor),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
