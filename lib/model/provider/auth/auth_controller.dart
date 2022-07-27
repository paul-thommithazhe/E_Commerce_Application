import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/model/user/user.dart' as model;

class AuthController extends ChangeNotifier {
  void registerUser(String name, String email, String password) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        model.User user = model.User(
            name: name,
            email: email,
            password: password,
            uid: userCred.user!.uid);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCred.user!.uid)
            .set(user.toJson());
      }
    } catch (e) {
      print(e);
    }
  }
}
