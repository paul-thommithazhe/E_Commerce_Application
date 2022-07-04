import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
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
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: kButtonandBorderColors,
                    ),
                    accountName: Text("Please Login  ! "),
                    accountEmail: Text("emailaddress@gmail.com"),
                    currentAccountPicture: CircleAvatar(
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
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text(
                'Login? ',
                style: TextStyle(color: kBlackColor, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
