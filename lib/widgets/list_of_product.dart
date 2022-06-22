import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/screens/home/widgets/row_product_widget.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class ListOfProdcutScreen extends StatelessWidget {
  ListOfProdcutScreen({Key? key, required this.categoryTitle})
      : super(key: key);
  String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtons(
          icon: Icons.arrow_back,
          buttonFunction: () {},
        ),
        title: Text(
          categoryTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: const [
                //two product in horizontal , for eg:> shirts two shirts in same row

                RowProductWidget(),
                RowProductWidget(),
                RowProductWidget(),
                RowProductWidget(),
                RowProductWidget(),
                RowProductWidget(),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButtons(
                            buttonFunction: () {}, icon: Icons.swap_vert),
                        const Text(
                          'Filter',
                          style: TextStyle(color: kBlackColor),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      indent: 10,
                      endIndent: 5,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        IconButtons(
                          buttonFunction: () {},
                          icon: Icons.filter_alt,
                        ),
                        const Text(
                          'Sort',
                          style: TextStyle(color: kBlackColor),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
