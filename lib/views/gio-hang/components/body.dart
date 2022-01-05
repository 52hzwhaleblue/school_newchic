import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';
import 'package:onboarding_demo/views/dang-nhap/components/back_arrow.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Positioned(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
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
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
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
                          Container(
                            height: 6,
                            width: size.width,
                            color: Colors.blueGrey[200],
                          ),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: null),
                              Text(
                                "Tất cả sản phẩm",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 180),
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 2,
                            width: size.width,
                            color: Colors.blueGrey[200],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: false, onChanged: null),
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              productMen[0].image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 40),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Tên sản phẩm",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "Giá sản phẩm",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 70,
                                              top: 60,
                                            ),
                                            child: Text(
                                              "Xóa",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
