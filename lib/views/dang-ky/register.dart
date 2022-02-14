library welcome.dart;

import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-ky/components/body.dart';
import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  //const welcome({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
