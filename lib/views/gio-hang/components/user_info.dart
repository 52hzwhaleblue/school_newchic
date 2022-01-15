import 'package:flutter/material.dart';

// ignore: camel_case_types
class userInformation extends StatelessWidget {
  const userInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.place,
                color: Colors.blue.shade700,
              ),
            ),
            Text(
              "Nguyễn Vũ Minh Long",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "|",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ),
            Text(
              "0699129879",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 19,
              ),
            ),
            Text(
              "33/1 Phùng Chí Kiên P. Tân Quý Q. Tân Phú",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
