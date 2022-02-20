import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/product_details_constants.dart';
import 'package:onboarding_demo/network/product_detail_request_productDetailImage.dart';
import 'package:onboarding_demo/network/product_detail_request_productColor.dart';
import 'package:onboarding_demo/network/product_detail_request.dart';

class productColor extends StatefulWidget {
  const productColor({
    Key key,
  }) : super(key: key);

  @override
  State<productColor> createState() => _productColorState();
}

class _productColorState extends State<productColor> {
  List<api_product_details> productDetailImageDatas = [];
  List<api_product_details> productDetailSKUDatas = [];
  List<api_product_details> productDetailDatas = [];

  @override
  void initState() {
    super.initState();
    requestProductDetailImage.fetchProductDetailImage().then((dataFromServe) {
      setState(() {
        productDetailImageDatas = dataFromServe;
      });
    });

    requestProductDetailColor.fetchProductDetailColor().then((dataFromServe) {
      setState(() {
        productDetailSKUDatas = dataFromServe;
      });
    });

    requestProductDetailAPI.fetchProductDetails().then((dataFromServe) {
      setState(() {
        productDetailDatas = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: productDetailImageDatas.length,
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  productSKU = productDetailDatas[index].SKU;
                  print(productSKU);
                });
              },
              child: Container(
                width: 60,
                color: Colors.red,
                child: Image.network(
                  '${productDetailImageDatas[index].image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
