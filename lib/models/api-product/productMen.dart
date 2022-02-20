// ignore: camel_case_types
class api_productMen {
  String id;
  String name;
  int price;
  int price_high;
  String image;
  int status;

  api_productMen({
    this.id,
    this.name,
    this.price,
    this.price_high,
    this.image,
    this.status,
  });

  api_productMen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    price_high = json['price_high'];
    image = json['image'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['price_high'] = this.price_high;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
