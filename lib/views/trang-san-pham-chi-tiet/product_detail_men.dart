import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/network/network_request.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/gio-hang/cart_screen.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/address_delivery.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/each_product_detail_image_color.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_detail_image.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_detail_name.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_detail_price.dart';

import 'package:onboarding_demo/network/product_detail_request.dart';
import 'package:onboarding_demo/network/product_detail_request_productColor.dart';
import 'package:onboarding_demo/network/product_detail_request_productDetailImage.dart';
import 'package:onboarding_demo/network/product_detail_request_productDetailSize.dart';
import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/components/product_detail_size.dart';

class ProductDetailMen extends StatefulWidget {
  ProductDetailMen({Key key}) : super(key: key);

  @override
  State<ProductDetailMen> createState() => _ProductDetailMenState();
}

class _ProductDetailMenState extends State<ProductDetailMen> {
  List<api_product_details> productDetailDatas = [];
  List<api_product_details> productDetailColorDatas = [];
  List<api_product_details> productDetailImageDatas = [];
  List<api_product_details> productDetailSizeDatas = [];

  @override
  void initState() {
    super.initState();
    requestProductDetailAPI.fetchProductDetails().then((dataFromServe) {
      setState(() {
        productDetailDatas = dataFromServe;
      });
    });

    requestProductDetailColor.fetchProductDetailColor().then((dataFromServe) {
      setState(() {
        productDetailColorDatas = dataFromServe;
      });
    });

    requestProductDetailImage.fetchProductDetailImage().then((dataFromServe) {
      setState(() {
        productDetailImageDatas = dataFromServe;
      });
    });

    requestProductDetailSize.fetchProductDetailSize().then((dataFromServe) {
      setState(() {
        productDetailSizeDatas = dataFromServe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _current = 0;

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // phần hiển thi hình ảnh chi tiết sản phẩm
              productImage(size: size),

              // giá tiền
              ProductPrice(),

              // tên sản phẩm
              ProductName(),

              // tên màu
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productDetailImageDatas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        " ${productDetailDatas[index].color}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),

              productColor(),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Size (US): ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              productDetailSize(productDetailSizeDatas: productDetailSizeDatas),

              // địa chỉ người nhận
              AddressDelivery(),
            ],
          ),
        ),
      ),
    );
  }
}
