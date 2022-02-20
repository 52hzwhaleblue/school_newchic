import 'package:flutter/material.dart';
import 'package:onboarding_demo/views/bottom_navigation.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/body.dart';
import 'package:onboarding_demo/views/trang-ca-nhan/components/profile_appbar.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.indigo[50],
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ProfileAppBar(),
        body: Body(size: size),
        bottomNavigationBar: Bottom_Navigation(),
      ),
    );
  }
}
