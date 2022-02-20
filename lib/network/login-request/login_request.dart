import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/models/user-api.dart';
import 'package:onboarding_demo/views/layout.dart';

class LoginCallAPI {
  static User userData;

  static Future<void> postDataToServer(
      BuildContext context, String email, String password) async {
    var client = http.Client();
    var response =
        await client.post(Uri.parse('http://192.168.1.220:9000/api/login'),
            body: ({
              'email': email,
              'password': password,
            }));
    print(response.body);
    if (response.statusCode == 200) {
      userData = userFromJson(response.body);
      print(userData);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Layout(),
          ));
    } else if (response.statusCode == 201) {
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              "Email hoặc mật khẩu sai",
            ),
            action: SnackBarAction(
              label: "Error",
              textColor: Colors.red,
              onPressed: () {},
            ),
          ),
        );
    } else {
      await Future.delayed(const Duration(seconds: 1));
      throw Exception("Không ổn mật khẩu hoặc email sai");
    }
  }
}
