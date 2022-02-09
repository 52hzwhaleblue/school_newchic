import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/MODEL_productArmy.dart';
import 'package:onboarding_demo/models/api-product/productArmy.dart';
import 'package:onboarding_demo/network/network_request.dart';

class item_card_Army extends StatefulWidget {
  const item_card_Army({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<item_card_Army> createState() => _item_cardState();
}

class _item_cardState extends State<item_card_Army> {
  List<api_productArmy> productData = [];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProductArmy().then((dataFromServe) {
      setState(() {
        productData = dataFromServe;
      });
    });
  }

  var listStatusIcons = List.filled(productArmy.length, false);
  List favoriteProducts_List = [];

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
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * productData.length / 4.5,
      width: size.width,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: productData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // bề ngang
            childAspectRatio: 0.75,
            mainAxisSpacing: 30, // khoảng cách trên dưới
            crossAxisSpacing: 30,
          ),
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                width: widget.size.width * 0.45,
                height: widget.size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 6),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: widget.size.width * 0.45,
                      height: 180,
                      child: Image.network(
                        '${productData[index].image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text(
                            '${productData[index].name}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
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
                                  Icons.add_shopping_cart,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.add_shopping_cart,
                                ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$${productData[index].price}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.pinkAccent[400],
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
