import 'package:flutter/material.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtons(
            icon: Icons.arrow_back,
            buttonFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
        title: const Text(
          'Category ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return const SizedBox(
                height: 100,
                child: CategoryScreen(),
              );
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text('hello');
  }
}
