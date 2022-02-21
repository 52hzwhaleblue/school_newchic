import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';

import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/product_detail_request.dart';

import 'package:onboarding_demo/network/product_detail_request_productName.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/views/dang-nhap/constants.dart';
import 'package:onboarding_demo/network/product_detail_request_productSKU.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';

class ProductName extends StatefulWidget {
  const ProductName({
    Key key,
  }) : super(key: key);

  @override
  State<ProductName> createState() => _ProductNameState();
}

class _ProductNameState extends State<ProductName> {
  List<api_productMen> productNameDatas = [];
  List<api_productMen> productPriceDatas = [];
  List<api_product_details> productDetailDatas = [];
  List<api_product_details> productDetailSKUDatas = [];

  Future<Cart_API> _futurecart;
  @override
  void initState() {
    super.initState();
    requestProductName.fetchProductDetailName().then((dataFromServe) {
      setState(() {
        productNameDatas = dataFromServe;
      });
    });

    requestProductDetailAPI.fetchProductDetails().then((dataFromServe) {
      setState(() {
        productDetailDatas = dataFromServe;
      });
    });

    requestProductDetailSKU.fetchProductDetailSKU().then((dataFromServe) {
      setState(() {
        productDetailSKUDatas = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<Cart_API> createCart(
      String userEmail,
      String productSKU,
      int quantity,
      int status,
    ) async {
      final response = await http.post(
        Uri.parse('http://192.168.1.220:9000/api/create-cart'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userEmail': userEmail,
          'productSKU': productSKU,
          'quantity': quantity,
          'status': status,
        }),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                "Thêm vào giỏ hàng thành công",
              ),
              action: SnackBarAction(
                label: "Xem giỏ hàng",
                textColor: Colors.green,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ));
                  });
                },
              ),
            ),
          );
        return Cart_API.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to create cart.');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productNameDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${productNameDatas[index].name}',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          productSKUCart = productDetailDatas[index].SKU;
                          quantityCart = 1;
                          status = 1;

                          _futurecart = createCart(
                            userEmailCart = userEmail,
                            productSKUCart,
                            quantityCart,
                            status,
                          );

                          print("Mã SKU" + productSKUCart);
                        });
                      },
                      icon: Icon(
                        Icons.add_shopping_cart_outlined,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
