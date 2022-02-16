import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/dang-ky/register.dart';
import 'package:onboarding_demo/views/dang-nhap/login_screen.dart';
import 'package:onboarding_demo/views/layout.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding_demo/views/xac-nhan-gio-hang/confirm_cart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConfirmCart(),
        // body: Layout(),
      ),
    );
  }
}
