import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:onboarding_demo/views/dang-nhap/components/google_facebook_logo.dart';

import 'back_arrow.dart';
import 'background.dart';
import 'dont_have_account.dart';
import 'forgot_password.dart';
import 'login_button.dart';
import 'sub_title.dart';
import 'title.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _buildTextFiled(IconData icon, String hintText, bool obscureText,
      TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.black54),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                color: Colors.grey,
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          background(),
          back_arrow(),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),

                    title(), // welcome back

                    SizedBox(height: 30),

                    subTitle(), // Sign in yout account

                    SizedBox(height: 50),

                    _buildTextFiled(
                        Icons.mail_outline, "Email", false, emailController),

                    SizedBox(height: 20),

                    _buildTextFiled(
                        Icons.lock, "Passwords", true, passwordController),

                    SizedBox(height: 10),

                    forgot_password(), // forgot password

                    login_button(),

                    dont_have_account(), // don't have aacount

                    google_facebook_logo(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
