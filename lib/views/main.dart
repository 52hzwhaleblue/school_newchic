import 'package:flutter/material.dart';

import 'package:onboarding_demo/views/onboarding_page.dart';
import 'package:onboarding_demo/views/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Detail(),
    );
  }
}
