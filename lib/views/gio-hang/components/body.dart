// import 'dart:html';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/cart_request.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/gio-hang/components/user_info.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final allChecked = checkBoxModal();

  var total = 0;
  List<Cart_API> cartData = [];
  Future<Cart_API> _futurecart;

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
    Size size = MediaQuery.of(context).size;
    FutureBuilder<Cart_API>(
      future: _futurecart,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.productName);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
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
    getStatusIcon(var index) {
      for (var i = 0; i < cartData.length; i++) {
        if (i == index) {
          return _checks[index];
        }
      }
    }

    Future<Cart_API> updateCart(
        int productID, int quantity, int subTotal) async {
      // int index = productID;
      final response = await http.patch(
        Uri.parse('http://192.168.1.220:3000/cart/$productID'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'Product ID': productID,
          'Quantity': quantity,
          'Sub Total': subTotal,
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return Cart_API.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to update cart.');
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
                                          productID_cart =
                                              '${cartData[index].productID}';
                                          productName_cart =
                                              '${cartData[index].productName}';

                                          productPrice_cart =
                                              '${cartData[index].price}';

                                          productImage_cart =
                                              '${cartData[index].image}';

                                          sub_total_cart = productPrice_cart;
                                          // cập nhật số lượng

                                          cartData[index].quantity++;
                                          quantity_cart =
                                              cartData[index].quantity;

                                          // khi nhấn add sẽ update sub_total vào table cart
                                          totalCart = quantity_cart *
                                              cartData[index].price;
                                          sub_total_cart = totalCart;

                                          _futurecart = updateCart(
                                            int.parse(productID_cart),
                                            quantity_cart,
                                            sub_total_cart,
                                          );
                                        });
                                      },
                                      icon: Icon(Icons.add_circle),
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
                                              : Text(
                                                  "1",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
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
                                        Icons.remove_circle,
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

// ignore: camel_case_types
class checkBoxModal {
  bool value;

  checkBoxModal({
    this.value = false,
  });
}
