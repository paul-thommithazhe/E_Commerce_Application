import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/home/home_screen.dart';
import 'package:take_it_and_go/screens/login/login.dart';
import 'package:take_it_and_go/screens/profile/profile.dart';

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: 230,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: kButtonandBorderColors,
                    ),
                    accountName: auth.currentUser != null
                        ? const Text('name')
                        : const Text("Please Login  ! "),
                    accountEmail: auth.currentUser != null
                        ? Text(auth.currentUser!.email!)
                        : const Text(''),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/default_profile.jpeg',
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'HOME',
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 15,
                      ),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: kBlackColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'PROFILE',
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 15,
                      ),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: kBlackColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            auth.currentUser != null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: kButtonandBorderColors),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ))
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login? ',
                      style: TextStyle(color: kBlackColor, fontSize: 18),
                    ),
                  ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}
