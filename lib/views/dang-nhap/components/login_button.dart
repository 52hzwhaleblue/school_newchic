import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/network/login-request/login_request.dart';
import 'package:onboarding_demo/views/dang-nhap/constants.dart';
import 'package:onboarding_demo/views/layout.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';

class login_button extends StatefulWidget {
  const login_button({
    Key key,
  }) : super(key: key);

  @override
  State<login_button> createState() => _login_buttonState();
}

class _login_buttonState extends State<login_button> {
  _login() async {
    await LoginCallAPI.postDataToServer(
      context,
      emailController.text,
      passwordController.text,
    );
    userEmail = emailController.text;
    print(userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        minWidth: double.maxFinite,
        onPressed: () {
          setState(() {
            _login();
          });
        },
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        color: Colors.pink.shade200,
      ),
    );
  }
}
