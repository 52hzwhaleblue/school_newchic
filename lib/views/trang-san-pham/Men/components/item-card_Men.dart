import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';

class item_card_Men extends StatefulWidget {
  const item_card_Men({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<item_card_Men> createState() => _item_cardState();
}

class _item_cardState extends State<item_card_Men> {
  var listStatusIcons = List.filled(productMen.length, false);
  var favoriteProducts_List = <String>[''];

  bool isRemoved = false;

  // set statsu icon
  void setStatusIcon(int index) {
    for (int i = 0; i < listStatusIcons.length; i++) {
      if (i == index) {
        // kiểm tra xem icon bấy giờ đang ở trạng thái nào true hay false
        if (listStatusIcons[i]) {
          // gán icon = false, icon true thì remove icon đi,
          listStatusIcons[i] = false;
        } else {
          // nếu trạng thái icon false -> add vào yêu thích
          listStatusIcons[i] = true;
          //favoriteProducts_List.add(favoriteProducts_List[index]);
        }
        break;
      }
    }
  }

  // trả về trạng thái icon true hay false
  getStatusIcon(var index) {
    for (var i = 0; i < listStatusIcons.length; i++) {
      if (i == index) {
        return listStatusIcons[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.only(right: 5),
      height: size.height * productMen.length / 4.5,
      width: size.width,

      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: productMen.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // bề ngang
            childAspectRatio: 0.75,
            mainAxisSpacing: 30, // khoảng cách trên dưới
            crossAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                width: widget.size.width * 0.45,
                height: widget.size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 6),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: widget.size.width * 0.45,
                      height: 180,
                      child: Image.asset(
                        productMen[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          productMen[index].title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                setStatusIcon(index);
                              });
                            },
                            icon: (getStatusIcon(index))
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border_outlined)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "\$${productMen[index].price}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
