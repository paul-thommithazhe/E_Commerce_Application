import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            //navigating to product detailed page
      
            onTap: () {
              print('tapped');
            },
            child: Container(
              height: 190,
              width: size.width / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey,
                image: const DecorationImage(
                    image: AssetImage('assets/images/shirt.webp'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ListTile(
          title: Text('Louis Philippe'),
          subtitle: Text('Men Slim Fit Casual Shirt'),
          trailing: IconButtons(
            buttonFunction: () {},
            icon: Icons.favorite_outline,
          ),
        ),
      
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: const [
          //     Text(
          //       'Louis Philippe',
          //       style: TextStyle(color: kBlackColor),
          //     ),
          //     // IconButtons(buttonFunction: () {}, icon: Icons.favorite_outline)
          //   ],
          // ),
          // const Text(
          //   'Men Slim Fit Casual Shirt',
          //   style: TextStyle(color: Colors.grey, fontSize: 12),
          // ),
          // const Text(
          //   '₹ 2,399',
          //   style: TextStyle(color: kBlackColor),
          // )
        ],
      ),
    );
  }
}
