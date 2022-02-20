import 'package:flutter/material.dart';

class NotReviewProductYet extends StatefulWidget {
  const NotReviewProductYet({
    Key key,
  }) : super(key: key);

  @override
  State<NotReviewProductYet> createState() => _NotReviewProductYetState();
}

class _NotReviewProductYetState extends State<NotReviewProductYet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        child: ListView.builder(
          itemCount: 2,
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 390,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            width: 70,
                            child: Image.network(
                              'https://imgaz1.chiccdn.com/thumb/view/oaupload/newchic/images/F7/5E/5cb9df8b-2766-448f-a595-2b545c013812.jpg?s=360x480',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Tên sản phẩm",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Nhà cung cấp",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: Colors.grey[350],
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.grey[350],
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.grey[350],
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.grey[350],
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.grey[350],
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
