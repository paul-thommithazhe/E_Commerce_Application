import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_it_and_go/screens/login/login.dart';

class ProductData extends ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>> getProductData(value) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc()
        .collection(value)
        .snapshots();
  }

  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}

class GooogleSigninProvider extends ChangeNotifier {
  final googleSignin = GoogleSignin();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  // Future googleLogin() async {
  //   await googleSignin.signIn();
  // }
}
