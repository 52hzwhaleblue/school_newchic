import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/constants.dart';

import 'package:onboarding_demo/views/dang-nhap/components/google_facebook_logo.dart';

import 'back_arrow.dart';
import 'background.dart';
import 'register_button.dart';
import 'sub_title.dart';
import 'title.dart';
import 'package:email_validator/email_validator.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _buildTextFiled(IconData icon, String hintText, bool obscureText,
      TextEditingController controller, TextInputType keyboardType) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.black54),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                color: Colors.white,
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

                    SizedBox(height: 30),

                    _buildTextFiled(
                      Icons.person,
                      "Fullname",
                      false,
                      fullNameController,
                      TextInputType.text,
                    ),

                    SizedBox(height: 20),

                    _buildTextFiled(
                      Icons.phone,
                      "Phone",
                      false,
                      phoneController,
                      TextInputType.number,
                    ),

                    SizedBox(height: 20),

                    _buildTextFiled(
                      Icons.mail_outline,
                      "Email",
                      false,
                      emailController,
                      TextInputType.emailAddress,
                    ),

                    SizedBox(height: 20),

                    _buildTextFiled(
                      Icons.lock,
                      "Passwords",
                      true,
                      passwordController,
                      TextInputType.text,
                    ),

                    SizedBox(height: 10),

                    register_button(),

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
