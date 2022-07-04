import 'package:flutter/material.dart';
import 'package:take_it_and_go/core/constants.dart';
import 'package:take_it_and_go/home.dart';
import 'package:take_it_and_go/screens/cart/widgets/user_address_screen.dart';
import 'package:take_it_and_go/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    'Login or Signup',
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  kHeight10,
                  InputTextFormField(
                    hintTitle: '+91 | Mobile Number *',
                    paddingHorizontal: 0,
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
                  GoogleOrEmailSignin(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        primary: kButtonandBorderColors),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class GoogleOrEmailSignin extends StatelessWidget {
  GoogleOrEmailSignin({Key? key}) : super(key: key);
  List<String> signInMethods = ['google2.png', 'gmail.jpeg'];
  List<String> singInMehodsName = ['Google', 'Email'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: ListView.separated(
          separatorBuilder: ((context, index) => const SizedBox(
                width: 130,
              )),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${signInMethods[index]}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.0,
                  ),
                ),
              ),
              Text(
                singInMehodsName[index],
                style: const TextStyle(
                    color: kBlackColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
