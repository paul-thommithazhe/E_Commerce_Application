import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.uid,
  });

  String name, email, password, uid;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'uid': uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      name: snapshot['username'],
      email: snapshot['email'],
      password: snapshot['password'],
      uid: snapshot['uid'],
    );
  }
}
