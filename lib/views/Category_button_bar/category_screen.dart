import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/home/categories/categories_model_MEN.dart';
import 'package:onboarding_demo/models/MODEL_productMen.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/home/home_screen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/WomenScreen.dart';
import 'package:onboarding_demo/views/home/components/bottom_navigation.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isCliked = false;

  var listItemContainer = List.filled(categoriesMEN.length, true);

  // set item color
  void setItemColor(int index) {
    for (int i = 0; i < listItemContainer.length; i++) {
      if (i == index) {
        if (listItemContainer[i]) {
          listItemContainer[i] = false;
        }
      } else {
        listItemContainer[i] = true;
      }
    }
  }

  // trả về trạng thái icon true hay false
  getItemColor(var index) {
    for (var i = 0; i < listItemContainer.length; i++) {
      if (i == index) {
        return listItemContainer[i];
      }
    }
  }

  int selectedIndex = 0;
  List<String> categories = [
    "Men",
    "Women",
    "Army",
  ];
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: new Positioned(
                  child: Column(
                    children: [
                      search_bar(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: KDefaultPadding),
                        child: SizedBox(
                          height: 25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) => buildTapBar(index),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          left(size),
                          right(size),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom_bar(size),
          ],
        ),
      ),
    );
  }

  Positioned bottom_bar(Size size) {
    final args = ModalRoute.of(context).settings.arguments as int;
    int selectedIndex = args;
    return new Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                      settings: RouteSettings(
                        arguments: selectedIndex,
                      ),
                    ),
                  );
                });
              },
              icon: Icon(Icons.home),
              iconSize: 30,
              color: selectedIndex == 0 ? Colors.pink : Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              color: selectedIndex == 1 ? Colors.pink : Colors.black,
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              icon: Icon(Icons.whatshot_outlined),
              iconSize: 30,
              color: selectedIndex == 2 ? Colors.pink : Colors.black,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              icon: Icon(Icons.chat_bubble_outline),
              iconSize: 30,
              color: selectedIndex == 3 ? Colors.pink : Colors.black,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
              icon: Icon(Icons.person_outline),
              iconSize: 30,
              color: selectedIndex == 4 ? Colors.pink : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget left(Size size) {
    return Column(
      children: [
        Container(
          width: size.width * 0.27,
          height: size.height,
          color: Colors.grey[350],
          child: GridView.builder(
            itemCount: categoriesMEN.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // số lượng hình ảnh muốn đẩy lên
              childAspectRatio: 0.75,
              mainAxisSpacing: 0, // khoảng cách trên dưới
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    setItemColor(index);
                  });
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 60,
                          color: getItemColor(index)
                              ? Colors.grey[350]
                              : Colors.black,
                        ),
                        Container(
                          width: size.width * 0.25,
                          color: getItemColor(index)
                              ? Colors.grey[350]
                              : Colors.white,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage(categoriesMEN[index].image),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      categoriesMEN[index].name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget right(Size size) {
    return Column(
      children: [
        Container(
          width: size.width * 0.73,
          height: size.height,
          color: Colors.white,
          child: GridView.builder(
            itemCount: productMen.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // số lượng hình ảnh muốn đẩy lên
              childAspectRatio: 0.75,
              mainAxisSpacing: 0, // khoảng cách trên dưới
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(productMen[index].image),
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(height: 20),
                  Text(
                    productMen[index].title,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Container search_bar() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(height: 1),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTapBar(int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (selectedIndex == 1) {}
          // if (selectedIndex == 0) {
          //   isCliked_Men = true;
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HomeScreen(),
          //     ),
          //   );
          //   print("Home screen"); // ee m t có 3 cái tapbar này lận á nha :))
          //   // mỗi cái screen là có cái tabar v á
          // } else if (selectedIndex == 1) {
          //   isCliked_Women = false;
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => WomenScreen(),
          //     ),
          //   );
          //   print("women screen");
          // } else {
          //   isCliked_Army = false;
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ArmyScreen(),
          //     ),
          //   );
          //   print("Army screen");
          // }
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.red : Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: KDefaultPadding / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
