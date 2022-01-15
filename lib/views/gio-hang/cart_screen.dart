import 'package:flutter/material.dart';

import 'package:onboarding_demo/views/gio-hang/components/body.dart';
import 'package:onboarding_demo/views/gio-hang/components/bottom_nav_cart.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "Shopping Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Body(),
        bottomNavigationBar: Bottom_Nav_Cart(),
      ),
    );
  }
}
