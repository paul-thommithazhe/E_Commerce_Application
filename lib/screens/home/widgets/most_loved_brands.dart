import 'package:flutter/material.dart';
// most loved brands banner images

class MostLovedBrands extends StatelessWidget {
  const MostLovedBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        children: [
          const Text('Most Loved Brands'),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const LovedBrandsBanner();
            },
          )
        ],
      ),
    );
  }
}

class LovedBrandsBanner extends StatelessWidget {
  const LovedBrandsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration:
          const BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
    );
  }
}
