import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-ky/register.dart';
import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/layout.dart';
import 'package:onboarding_demo/views/onboarding_page/onboarding_page.dart';
import 'package:onboarding_demo/views/thiet-lap-ca-nhan/profile_setting.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/account_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: ConfirmCart(),
        // body: ProfileSetting(),
        body: LoginScreen(),
      ),
    );
  }
}
