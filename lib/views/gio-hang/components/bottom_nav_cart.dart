import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/cart_api.dart';
import 'package:onboarding_demo/network/cart_request.dart';
import 'package:onboarding_demo/views/constants.dart';

// ignore: camel_case_types
class Bottom_Nav_Cart extends StatefulWidget {
  Bottom_Nav_Cart({Key key}) : super(key: key);

  @override
  _Bottom_Nav_CartState createState() => _Bottom_Nav_CartState();
}

// ignore: camel_case_types
class _Bottom_Nav_CartState extends State<Bottom_Nav_Cart> {
  final allChecked = checkBoxModal(title: "Tất cả sản phẩm");
  var quantityTotal = 0;

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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "$totalCart đ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: 200,
            color: Colors.red,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Checkout ($quantityTotal)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class checkBoxModal {
  String title;
  bool value;

  checkBoxModal({
    @required this.title,
    this.value = false,
  });
}
