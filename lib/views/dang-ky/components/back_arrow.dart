import 'package:flutter/material.dart';

class back_arrow extends StatefulWidget {
  back_arrow({Key key}) : super(key: key);

  @override
  _back_arrowState createState() => _back_arrowState();
}

class _back_arrowState extends State<back_arrow> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: 20,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            setState(() {
              print("123sd");
            });
          },
        ));
  }
}
