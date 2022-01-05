import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-nhap/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEEDECE),
      body: Body(),
    );
  }
}
