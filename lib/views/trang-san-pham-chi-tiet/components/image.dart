import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:onboarding_demo/models/home/banner/MEN/MODEL_banner_MEN.dart';
import 'package:onboarding_demo/network/product_detail_request.dart';

// ignore: camel_case_types
class image extends StatefulWidget {
  const image({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<image> createState() => _imageState();
}

// ignore: camel_case_types
class _imageState extends State<image> {
  int _current = 0;

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
    return Stack(
      children: [
        Row(
          children: [
            Container(
              color: Colors.amber,
              width: widget.size.width,
              height: widget.size.height * 0.49,
              child: Swiper(
                onIndexChanged: (index) {
                  _current = index;
                },
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemCount: productDetailDatas.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(productDetailDatas[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        new Positioned(
          top: 20,
          left: 20,
          child: Container(
            width: 35.0,
            height: 35.0,
            decoration: new BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 20,
          right: 20,
          child: Row(
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                decoration: new BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
