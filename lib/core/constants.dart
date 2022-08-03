import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//constant colors

const kPrimaryColor = Colors.white;
const kBlackColor = Colors.black;
final kGreyColor = Colors.grey.shade400;
const kButtonandBorderColors = Color(0xffF02052);

// sized boxes

const kHeight10 = SizedBox(height: 10);

const kWidth20 = SizedBox(width: 20);

//divider

const kDivider = Divider(thickness: 2);

//Firebase auth

final FirebaseAuth auth = FirebaseAuth.instance;

// stripe api keys 

const stripePublishableKey = 'pk_test_51LQOawSFLCAQCxPW1SeG0WVl4v8NlZauVaZFk1gYQZrCe8Gk9louGKiFihXNTsiUCpJkjPPLxNgvHo6bC4ouDd8B00NSCwfzVm';

const secretKey  =  'sk_test_51LQOawSFLCAQCxPW6PRoSnpq2nZgZzC990Y0aor9TEyLX9gsJNK2PCZCQmcTorgCRjvgXf03gmZhULaldkx5fgNA00bDuZQKfq';