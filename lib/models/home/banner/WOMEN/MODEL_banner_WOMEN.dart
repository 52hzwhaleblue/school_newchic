// ignore_for_file: camel_case_types

class BannerModel_WOMEN {
  String image;

  BannerModel_WOMEN({
    this.image,
  });
}

List<BannerModel_WOMEN> bannersWomen =
    bannersData.map((item) => BannerModel_WOMEN(image: item['image'])).toList();

var bannersData = [
  {"image": "assets/home/banners/WOMEN/banner1.jpg"},
  {"image": "assets/home/banners/WOMEN/banner2.jpg"},
  {"image": "assets/home/banners/WOMEN/banner3.jpg"},
];
