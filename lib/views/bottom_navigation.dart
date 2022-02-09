// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/danh-muc-san-pham/category_screen.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/layout.dart';

import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';

// ignore: camel_case_types
class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({
    Key key,
  }) : super(key: key);

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedIndex = 0;

  void _onItemsTap(var index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Layout(),
            settings: RouteSettings(
              arguments: _selectedIndex,
            ),
          ),
        );
      }
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
            settings: RouteSettings(
              arguments: 1,
            ),
          ),
        );
      }
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
            settings: RouteSettings(
              arguments: _selectedIndex,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            size: 25,
          ),
          label: "Category",
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 2
              ? Icon(
                  Icons.favorite,
                  size: 25,
                )
              : Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 25,
          ),
          label: "Account",
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemsTap,
    );
  }
}
