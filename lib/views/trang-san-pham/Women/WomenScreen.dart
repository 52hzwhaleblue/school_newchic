import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onboarding_demo/views/SearchScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/components/body.dart';

class WomenScreen extends StatefulWidget {
  WomenScreen({Key key}) : super(key: key);

  @override
  _WomenScreenState createState() => _WomenScreenState();
}

class _WomenScreenState extends State<WomenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
