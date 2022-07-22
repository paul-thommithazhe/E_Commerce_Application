import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/categories/widgets/category_item.dart';
import 'package:take_it_and_go/widgets/icon_button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButtons(
            icon: Icons.arrow_back,
            buttonFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }),
        title: const Text(
          'CATEGORY ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('category').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        title: snapshot.data!.docs[index]['name'],
                        image: snapshot.data!.docs[index]['image'],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}



// CategoryItem(title: 'Shirts'),
//               SizedBox(width: 30),
//               CategoryItem(title: 'T-Shirts'),
//               SizedBox(width: 30),
//               CategoryItem(title: 'Jeans'),