import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onboarding_demo/network/product_detail_request_productPrice.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';

class ProductPrice extends StatefulWidget {
  const ProductPrice({
    Key key,
  }) : super(key: key);

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {
  List<api_productMen> productPriceDatas = [];

  @override
  void initState() {
    super.initState();
    requestProductPrice.fetchProductDetailPrice().then((dataFromServe) {
      setState(() {
        productPriceDatas = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productPriceDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            NumberFormat.decimalPattern()
                                .format(productPriceDatas[index].price),
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.pink.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "đ",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.pinkAccent[400],
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.star_rate, color: Colors.amber.shade700),
                    Icon(Icons.star_rate, color: Colors.amber.shade700),
                    Icon(Icons.star_rate, color: Colors.amber.shade700),
                    Icon(Icons.star_rate, color: Colors.amber.shade700),
                    Icon(Icons.star_rate, color: Colors.amber.shade700),
                    Text("(Lượt đánh giá)"),
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
