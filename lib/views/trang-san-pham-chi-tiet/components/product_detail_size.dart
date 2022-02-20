import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';

class productDetailSize extends StatelessWidget {
  const productDetailSize({
    Key key,
    @required this.productDetailSizeDatas,
  }) : super(key: key);

  final List<api_product_details> productDetailSizeDatas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productDetailSizeDatas.length,
          itemBuilder: (BuildContext context, int index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: Text(
                      '${productDetailSizeDatas[index].size}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
