import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/Category_button_bar/category_screen.dart';
import 'package:onboarding_demo/views/bottom-navigation-bar/navbar_screen.dart';

import 'package:onboarding_demo/views/home/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding_demo/views/onboarding_page/onboarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
