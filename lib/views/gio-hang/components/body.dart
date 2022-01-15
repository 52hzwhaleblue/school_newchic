// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/cart_request.dart';
import 'package:onboarding_demo/network/network_request.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/dang-nhap/components/back_arrow.dart';
import 'package:onboarding_demo/views/gio-hang/components/user_info.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final allChecked = checkBoxModal(title: "Tất cả sản phẩm");

  var total = 0;
  List<Cart_API> cartData = [];

  @override
  void initState() {
    super.initState();
    CartRequest.fetchCart().then((dataFromServe) {
      setState(() {
        cartData = dataFromServe;
      });
    });

    totalCart = total;
  }

  final List<bool> _checks = List.generate(14, (_) => false);

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: size.height,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                userInformation(),
                Container(
                  height: 6,
                  width: size.width,
                  color: Colors.blueGrey[200],
                ),

                // checkbox tất cả sản phẩm

                Container(
                  height: 2,
                  width: size.width,
                  color: Colors.blueGrey[200],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          checkColor: Colors.white,
                          value: allChecked.value,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() {
                              allChecked.value = !allChecked.value;
                            });
                          },
                        ),
                        Text(
                          "All",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[400],
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // danh sách giỏ hàng
                itemCarts(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container itemCarts(Size size) {
    void checkStatus(int index) {
      for (var i = 0; i < cartData.length; i++) {
        if (i == index) {
          _checks[index] = true;
        } else {
          _checks[index] = false;
        }
        break;
      }
    }

    getStatusIcon(var index) {
      for (var i = 0; i < cartData.length; i++) {
        if (i == index) {
          return _checks[index];
        }
      }
    }

    return Container(
      height: size.height * cartData.length / 6.5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: cartData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      shape: CircleBorder(),
                      activeColor: Colors.red,
                      checkColor: Colors.white,
                      value:
                          (allChecked.value == false) ? _checks[index] : true,
                      onChanged: (newValue) {
                        setState(() {
                          _checks[index] = newValue;
                        });
                      }),
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
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    color: Colors.redAccent[400],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            // thêm bớt sản phẩm
                            Container(
                              width: 150,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartData[index].quantity++;

                                          totalCart = cartData[index].quantity *
                                              cartData[index].price;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 27,
                                        width: 27,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: (getStatusIcon(index))
                                              ? Text(
                                                  '${cartData[index].quantity}',
                                                  style: TextStyle(
                                                    fontSize: 21,
                                                  ),
                                                )
                                              : Text("1"),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartData[index].quantity--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
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
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class checkBoxModal {
  String title;
  bool value;

  checkBoxModal({
    @required this.title,
    this.value = false,
  });
}
