import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/gio-hang-xac-nhan/components/app-bar.dart';
import 'package:onboarding_demo/views/gio-hang-xac-nhan/components/body.dart';
import 'package:onboarding_demo/views/gio-hang-xac-nhan/components/bottom_nav_cart.dart';

class ConfirmCart extends StatefulWidget {
  ConfirmCart({Key key}) : super(key: key);

  @override
  State<ConfirmCart> createState() => _ConfirmCartState();
}

class _ConfirmCartState extends State<ConfirmCart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body: Body(size: size),
        bottomNavigationBar: Bottom_Nav_Cart(),
      ),
    );
  }
}
