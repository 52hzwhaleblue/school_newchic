import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:onboarding_demo/models/home/banner/MEN/MODEL_banner_MEN.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/ArmyScreen.dart';
import 'package:onboarding_demo/views/trang-san-pham/Army/components/body.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/components/item-card_Men.dart';
import 'package:onboarding_demo/views/trang-san-pham/Men/components/title.dart';
import 'package:onboarding_demo/views/loai-san-pham/Categoies_List_Men.dart';
import 'package:onboarding_demo/views/trang-san-pham/Women/components/body.dart';

class BodyMen extends StatefulWidget {
  BodyMen({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<BodyMen> {
  final _controller = TextEditingController();
  int _current = 0;

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

            builBannerMEN(context), // banner

            Categories_List_Men(size: size),

            title(), // You might also like

            item_card_Men(size: size),
          ],
        ),
      ),
    );
  }

  int selectedIndex = 0;

  Widget buildTapBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (selectedIndex == 1) {
            print(index);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyWomen(),
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

  Widget builBannerMEN(BuildContext context) {
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
                _current = index;
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: bannersMen.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(bannersMen[index].image),
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
