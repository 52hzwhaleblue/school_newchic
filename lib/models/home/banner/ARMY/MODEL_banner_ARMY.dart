class BannerModel_ARMY {
  String image;

  BannerModel_ARMY({
    this.image,
  });
}

List<BannerModel_ARMY> bannersARMY =
    bannersData.map((item) => BannerModel_ARMY(image: item['image'])).toList();

var bannersData = [
  {"image": "assets/home/banners/ARMY/army1.jpg"},
];
