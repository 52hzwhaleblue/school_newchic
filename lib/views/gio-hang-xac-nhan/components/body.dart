import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.place,
                  color: Colors.blue.shade700,
                ),
              ),
              Text(
                "Nguyễn Vũ Minh Long",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "|",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
              ),
              Text(
                "0699129879",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  width: widget.size.width * 85 / 100,
                  height: 100,
                  color: Colors.orange,
                  child: Text("Địa chỉ ..........."),
                ),
                Container(
                  width: widget.size.width * 10 / 100,
                  height: 100,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Image.network(
                          'https://imgaz1.chiccdn.com/thumb/large/oaupload/newchic/images/90/72/71c13653-cd63-45bf-871e-c600f5d7d109.jpg?s=702x936',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: size.width * 0.71,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "asdasdsad",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SL: x1",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "240.000 đ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
