import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/home/banner/ARMY/MODEL_banner_ARMY.dart';

import 'package:onboarding_demo/views/trang-san-pham/Army/ArmyScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/WomenScreen.dart';
import 'package:onboarding_demo/views/categories%20list/Categoies_List_Army.dart';

import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/components/item-card_Army.dart';

import 'package:onboarding_demo/views/home/components/title.dart';
import 'package:onboarding_demo/views/home/home_screen.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = TextEditingController();
  int _currentMen = 0;
  int _currentWomen = 0;
  int _currentArmy = 0;

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
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  searchBar(), // search bar

                  // Categories(), // tab bar

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: KDefaultPadding),
                    child: SizedBox(
                      height: 25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => buildTapBar(index),
                      ),
                    ),
                  ),

                  builBannerARMY(context),

                  Categories_List_Army(size: size),

                  title(), // You might also like

                  item_card_Army(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
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
                builder: (context) => HomeScreen(),
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
                builder: (context) => WomenScreen(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }

          if (selectedIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArmyScreen(),
                settings: RouteSettings(
                  arguments: selectedIndex,
                ),
              ),
            );
          }

          if (selectedIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArmyScreen(),
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

  Widget builBannerARMY(BuildContext context) {
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
                _currentArmy = index;
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: bannersARMY.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(bannersARMY[index].image),
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
}
