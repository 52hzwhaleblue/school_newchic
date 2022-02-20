import 'package:flutter/material.dart';

class ProcessOrder extends StatefulWidget {
  const ProcessOrder({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ProcessOrder> createState() => _ProcessOrderState();
}

class _ProcessOrderState extends State<ProcessOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Container(
        width: widget.size.width,
        height: 180,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 8,
                  ),
                  child: Text(
                    "Đơn hàng của tôi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    top: 8,
                  ),
                  child: Text(
                    "Xem lịch sử",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo[50],
                              radius: 28,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.price_change_outlined,
                                ),
                              ),
                            ),
                          ),
                          Text(" Chờ thanh toán")
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo[50],
                              radius: 28,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.inventory_2_outlined,
                                ),
                              ),
                            ),
                          ),
                          Text(" Đang xử lý")
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo[50],
                              radius: 28,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.local_shipping_outlined,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            " Chờ vận chuyển",
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo[50],
                              radius: 28,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.reviews_outlined,
                                ),
                              ),
                            ),
                          ),
                          Text(" Chờ đánh giá")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
