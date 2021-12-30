library home.dart;

import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/Account_button_bar/account_screen.dart';
import 'package:onboarding_demo/views/Category_button_bar/category_screen.dart';

import 'package:onboarding_demo/views/home/components/body.dart';

import 'components/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemsTap(var index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOption = <Widget>[
    Body(),
    CategoryScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        body: Body(),
      ),
    );
  }

  AppBar header() {
    return AppBar(
      // backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Newchic",
        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),

      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
