import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

class Header extends StatefulWidget with PreferredSizeWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          margin: EdgeInsets.only(left: 50),
          child: Text("Xác Nhận Đơn Hàng"),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
        ));
  }
}
