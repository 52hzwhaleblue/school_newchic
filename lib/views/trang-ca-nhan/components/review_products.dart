import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Container(
          width: size.width,
          height: 60,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 8,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.rate_review,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Đánh giá sản phẩm",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 110,
                    ),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.yellow[800],
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 8,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
