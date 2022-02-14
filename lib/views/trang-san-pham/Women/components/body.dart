import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:onboarding_demo/models/home/banner/WOMEN/MODEL_banner_WOMEN.dart';

import 'package:onboarding_demo/views/loai-san-pham/Categoies_List_Women.dart';

import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/components/body.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/MenScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/components/title.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/WomenScreen.dart';

import 'package:onboarding_demo/views/trang-san-pham/Women/components/item-card_Women.dart';

import 'package:onboarding_demo/views/trang-san-pham/Army/ArmyScreen.dart';

class BodyWomen extends StatefulWidget {
  BodyWomen({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<BodyWomen> {
  int _currentWomen = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[1]));
    }
  }

  List<String> categories = [
    "Men",
    "Women",
    "Army",
  ];

  // first index will be selected

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            main(context, size),
          ],
        ),
      ),
    );
  }

  Positioned main(BuildContext context, Size size) {
    return Positioned(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KDefaultPadding),
              child: SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildTapBar(index),
                ),
              ),
            ),

            builBannerWOMEN(context),

            Categories_List_Women(size: size),

            title(), // You might also like

            item_card_Women(size: size),
          ],
        ),
      ),
    );
  }

  Widget buildTapBar(int index) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context).settings.arguments as int;
    int selectedIndex = args;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;

          if (selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenScreen(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }
          if (selectedIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyWomen(),
                settings: RouteSettings(
                  arguments: 1,
                ),
              ),
            );
          }
          if (selectedIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyArmy(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }
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
                color: selectedIndex == index ? Colors.red : KTextLightColor,
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

  Widget builBannerWOMEN(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            child: Swiper(
              onIndexChanged: (index) {
                _currentWomen = index;
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: bannersWomen.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(bannersWomen[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
//  int bottomBar_index = 0;
//   Positioned bottom_bar(Size size) {
//     return new Positioned(
//       bottom: 0,
//       child: Container(
//         width: size.width,
//         height: 60,
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   bottomBar_index = 0;
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomeScreen(),
//                     ),
//                   );
//                 });
//               },
//               icon: Icon(Icons.home),
//               iconSize: 30,
//               color: bottomBar_index == 0 ? Colors.pink : Colors.black,
//             ),
//             IconButton(
//               icon: Icon(Icons.category_outlined),
//               onPressed: () {
//                 setState(() {
//                   bottomBar_index = 1;
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CategoryScreen(),
//                       settings: RouteSettings(
//                         arguments: bottomBar_index,
//                       ),
//                     ),
//                   );
//                 });
//               },
//               color: bottomBar_index == 1 ? Colors.pink : Colors.black,
//               iconSize: 30,
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   bottomBar_index = 2;
//                 });
//               },
//               icon: Icon(Icons.shopping_cart_outlined),
//               iconSize: 30,
//               color: bottomBar_index == 2 ? Colors.pink : Colors.black,
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   bottomBar_index = 3;
//                 });
//               },
//               icon: Icon(Icons.chat_bubble_outline),
//               iconSize: 30,
//               color: bottomBar_index == 3 ? Colors.pink : Colors.black,
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   bottomBar_index = 4;
//                 });
//               },
//               icon: Icon(Icons.person_outline),
//               iconSize: 30,
//               color: bottomBar_index == 4 ? Colors.pink : Colors.black,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
