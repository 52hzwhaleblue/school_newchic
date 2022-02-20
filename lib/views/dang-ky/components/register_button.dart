import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/user-api.dart';
import 'package:onboarding_demo/network/register_api.dart';
import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';
import 'package:onboarding_demo/views/layout.dart';
import 'package:http/http.dart' as http;

import 'package:onboarding_demo/views/constants.dart';

class register_button extends StatefulWidget {
  const register_button({
    Key key,
  }) : super(key: key);

  @override
  State<register_button> createState() => _register_buttonState();
}

// ignore: camel_case_types
class _register_buttonState extends State<register_button> {
  _register() async {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    var userId = "user - " + getRandomString(5);
    var token = getRandomString(10);

    var userData = {
      'id': userId,
      'full_name': fullNameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'token': token,
    };

    var response = await RegisterCallAPI().postData(userData);
    print(" Reponse :  $response");

    var body = json.decode(response);
    print(body);

    if (body['success']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (body['success'] == false) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              "Email đã tồn tại trong hệ thống",
            ),
            action: SnackBarAction(
              label: "Error",
              textColor: Colors.red,
              onPressed: () {},
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        minWidth: double.maxFinite,
        onPressed: () {
          setState(() {
            // đăng ký tài khoản
            _register();
          });
        },
        child: Text(
          "Register",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        color: Colors.pink.shade200,
      ),
    );
  }
}
