import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/cart_request.dart';
import 'package:onboarding_demo/network/network_request.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/dang-nhap/components/back_arrow.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart_API> cartData = [];
  @override
  void initState() {
    super.initState();
    CartRequest.fetchCart().then((dataFromServe) {
      setState(() {
        cartData = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: size.height,
        child: Scaffold(
          body: SingleChildScrollView(
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
                    Container(
                      height: 6,
                      width: size.width,
                      color: Colors.blueGrey[200],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isChecked = false;
                            });
                          },
                          icon: (isChecked == true)
                              ? Icon(Icons.check_box)
                              : Icon(Icons.check_box_outline_blank),
                        ),
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
                              color: Colors.red,
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
                    Container(
                      height: size.height * cartData.length / 6.5,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cartData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(value: false, onChanged: null),

                                  // image
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      '${cartData[index].image}',
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  //info
                                  Container(
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${cartData[index].productName}',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${cartData[index].price}.000',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Text(
                                                  'đ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color:
                                                        Colors.redAccent[400],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            // thêm bớt sản phẩm
                                            Container(
                                              width: 100,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      20.0,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 27,
                                                        width: 27,
                                                        color: Colors.white,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            '+',
                                                            style: TextStyle(
                                                              fontSize: 21,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 27,
                                                        width: 27,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            '1',
                                                            style: TextStyle(
                                                              fontSize: 21,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 27,
                                                        width: 27,
                                                        color: Colors.white,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            '-',
                                                            style: TextStyle(
                                                              fontSize: 21,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Xóa",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
