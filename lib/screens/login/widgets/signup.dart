import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/model/provider/auth/auth_controller.dart';
import 'package:take_it_and_go/screens/login/login.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Signup',
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  kHeight10,
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  const Text(
                    'By continuing , I agree to the Terms of Use & Privacy Policy,',
                    style: TextStyle(
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // GoogleSignin(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        primary: kButtonandBorderColors),
                    onPressed: () {
                       authController.registerUser(nameController.text,
                          emailController.text, passwordController.text);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('signup page');

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'Already have one?',
                            style: TextStyle(color: kBlackColor, fontSize: 15),
                          ),
                        ),
                        Text(
                          'Login Here',
                          style: TextStyle(
                              color: kButtonandBorderColors,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class GoogleSignin extends StatelessWidget {
  GoogleSignin({Key? key}) : super(key: key);
  List<String> signInMethods = ['google2.png', 'gmail.jpeg'];
  List<String> singInMehodsName = ['Google', 'Email'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: kButtonandBorderColors,
                  ),
                  child: const Text('Signup'),
                ),
                GestureDetector(
                  onTap: () {
                    print('google email');
                  },
                  child: Container(
                    width: 40,
                    height: 40.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/${signInMethods[0]}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.grey.shade500,
                        width: 1.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              'Google',
              style: TextStyle(color: kBlackColor),
            )
          ],
        ),
      ),
    );
  }
}
