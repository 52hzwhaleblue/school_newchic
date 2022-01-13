import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/danh-muc-san-pham/category_screen.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/layout.dart';

import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';

class Bottom_Navigation extends StatefulWidget {
  // này nè
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

  List<Widget> _widgetOption = <Widget>[
    CategoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
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
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 25,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 25,
          ),
          label: "Account",
        ),
      ],
      currentIndex: _selectedIndex, // :))))
      onTap: _onItemsTap,
    );
  }
}
