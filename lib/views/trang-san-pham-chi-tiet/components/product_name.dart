import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:onboarding_demo/network/product_detail_request.dart';

class ProductName extends StatefulWidget {
  const ProductName({
    Key key,
  }) : super(key: key);

  @override
  State<ProductName> createState() => _ProductNameState();
}

class _ProductNameState extends State<ProductName> {
  List<api_product_details> productDetailDatas = [];
  @override
  void initState() {
    super.initState();
    requestProductDetailAPI.fetchProductDetails().then((dataFromServe) {
      setState(() {
        productDetailDatas = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Thông tin chi tiết sản phẩm Thông tin chi tiết sản phẩm",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
