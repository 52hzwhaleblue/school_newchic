class BannerModel_MAN {
  String image;

  BannerModel_MAN({
    this.image,
  });
}

List<BannerModel_MAN> bannersMen =
    bannersData.map((item) => BannerModel_MAN(image: item['image'])).toList();

var bannersData = [
  {"image": "assets/home/banners/MEN/banner.gif"},
  {"image": "assets/home/banners/MEN/banner3.jpg"},
  {"image": "assets/home/banners/MEN/banner4.jpg"},
];
