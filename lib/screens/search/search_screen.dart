import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/screens/search/widgets/search_recommened_product.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: CupertinoSearchTextField(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                SearchRecommenedProductItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
