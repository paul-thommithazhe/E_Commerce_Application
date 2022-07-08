import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_it_and_go/core/constants.dart';

// main banner image in the home page

class MainBannerImage extends StatelessWidget {
  const MainBannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Banner').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Something Went Wrong',
              style: TextStyle(color: kBlackColor),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Loading',
                style: TextStyle(color: kBlackColor),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: kButtonandBorderColors,
              ),
            );
          }

          return Container(
            width: double.infinity,
            height: 245,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(snapshot.data!.docs[0]['images']),
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
