import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/network_request.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/dang-nhap/constants.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/product_details_constants.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/product_detail_men.dart';

// ignore: camel_case_types
class item_card_Men extends StatefulWidget {
  const item_card_Men({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<item_card_Men> createState() => _item_cardState();
}

class _item_cardState extends State<item_card_Men> {
  Future<Cart_API> _futurecart;
  Future<api_productMen> _futureProductMen;

  List<api_productMen> productMenData = [];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProductMen().then((dataFromServe) {
      setState(() {
        productMenData = dataFromServe;
      });
    });
  }

  var listStatusIcons = List.filled(productMen.length, false);
  List favoriteProducts_List = [];

  bool isRemoved = false;

  // set statsu icon
  void setStatusIcon(int index) {
    for (int i = 0; i < listStatusIcons.length; i++) {
      if (i == index) {
        // kiểm tra xem icon bấy giờ đang ở trạng thái nào true hay false
        if (listStatusIcons[i]) {
          // gán icon = false, icon true thì remove icon đi,
          listStatusIcons[i] = false;
          // favoriteProducts_List.removeAt(i);
        } else {
          // nếu trạng thái icon false -> add vào yêu thích
          listStatusIcons[i] = true;
          favoriteProducts_List.add(listStatusIcons[index]);
        }
        break;
      }
    }
  }

  // trả về trạng thái icon true hay false
  getStatusIcon(var index) {
    for (var i = 0; i < listStatusIcons.length; i++) {
      if (i == index) {
        return listStatusIcons[i];
      }
    }

    for (var i = 0; i < favoriteProducts_List.length; i++) {
      if (i == index) {
        return favoriteProducts_List[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Future<api_productMen> updateProductMen(int id, String name, int price,
    //     String image, int quantity, String type, bool status) async {
    //   var index = int.parse('$id');
    //   final response = await http.post(
    //     Uri.parse("http://192.168.1.220:3000/productsMen/'$index' "),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'id': id,
    //       'name': name,
    //       'price': price,
    //       'quantity': quantity,
    //       'image': image,
    //       'type': type,
    //       'status': status,
    //     }),
    //   );

    //   if (response.statusCode == 200) {
    //     // If the server did return a 200 OK response,
    //     // then parse the JSON.
    //     return api_productMen.fromJson(jsonDecode(response.body));
    //   } else {
    //     // If the server did not return a 200 OK response,
    //     // then throw an exception.
    //     throw Exception('Failed to update product.');
    //   }
    // }

    return Container(
      padding: EdgeInsets.only(right: 5),
      height: size.height * productMen.length / 4.5,
      width: size.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productMenData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // bề ngang
          childAspectRatio: 0.75,
          mainAxisSpacing: 30, // khoảng cách trên dưới
          crossAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: widget.size.width * 0.45,
              height: widget.size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 6),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    productID = productMenData[index].id;
                    print(productID);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailMen(),
                      ),
                    );
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: widget.size.width * 0.45,
                      height: 180,
                      child: Image.network(
                        '${productMenData[index].image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  ' ${productMenData[index].name}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(productMenData[index].price),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink.shade400,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "đ",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pinkAccent[400],
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(productMenData[index].price_high),
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                "đ",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
