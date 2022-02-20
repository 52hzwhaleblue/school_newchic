import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/SearchScreen.dart';
import 'package:onboarding_demo/views/bottom_navigation.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';
import 'package:badges/badges.dart';

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: MyAppBar(size, context),
          body: MenScreen(),
          bottomNavigationBar: Bottom_Navigation()),
    );
  }

  AppBar MyAppBar(Size size, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: size.width,
      leading: Container(
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    "New",
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: "RobotoMono",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "chic",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: 250,
            height: 40,
            child: TextField(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: 'Search',
                prefixIcon: IconButton(
                  enableFeedback: false,
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        Badge(
          position: BadgePosition.topEnd(
            top: 0,
            end: 0,
          ),
          badgeContent: Text(
            '9',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          child: IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey,
              size: 32,
            ),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
